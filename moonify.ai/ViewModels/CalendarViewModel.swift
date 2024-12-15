import Foundation
import SwiftSoup

class MoonCalendarViewModel: ObservableObject {
    @Published var calendarData: [MoonCalendarModel] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading = false

   
    func fetchMoonCalendar() {
        guard let url = URL(string: apiURL) else {
            errorMessage = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-Rapidapi-Key")
        request.addValue("moon-phase.p.rapidapi.com", forHTTPHeaderField: "X-Rapidapi-Host")

        isLoading = true

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            }

            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                return
            }

            guard let data = data, let htmlString = String(data: data, encoding: .utf8) else {
                DispatchQueue.main.async {
                    self?.errorMessage = "No data received"
                }
                return
            }

            self?.parseHTML(htmlString)
        }.resume()
    }

    private func parseHTML(_ html: String) {
        do {
            let document = try SwiftSoup.parse(html)
            guard let table = try document.select("table").first() else {
                throw NSError(domain: "MoonCalendarError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Table not found"])
            }
            let rows: Elements = try table.select("tr")

            var parsedData: [MoonCalendarModel] = []

            for row in rows {
                let cells = try row.select("td")

                if cells.count > 0 {
                    let month = try cells.first()?.text() ?? ""
                    let phases = try cells.dropFirst().map { try $0.text() }
                    parsedData.append(MoonCalendarModel(month: month, phases: phases))
                }
            }

            DispatchQueue.main.async {
                self.calendarData = parsedData
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to parse HTML: \(error.localizedDescription)"
            }
        }
    }
}
