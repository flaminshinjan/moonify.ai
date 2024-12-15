import Foundation
import CoreLocation
import Foundation
import CoreLocation

class MoonViewModel: NSObject, ObservableObject {
    @Published var moonData: MoonData?
    @Published var errorMessage: String?
    @Published var location: String?
    @Published var currentMonthData: MoonCalendarModel?
    @Published var currentDate: Int = Calendar.current.component(.day, from: Date())

    
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    func fetchCurrentMonthData() {
            let mockPhases = ["🌑", "🌑", "🌒", "🌒","🌒","🌒","🌓","🌓","🌓","🌓", "🌔", "🌔", "🌔", "🌕","🌕","🌕","🌕", "🌖", "🌖", "🌖",  "🌗",   "🌗",   "🌗",   "🌗",   "🌗", "🌘", "🌘", "🌘", "🌘", "🌑",  "🌑", "-"]
            currentMonthData = MoonCalendarModel(month: "December", phases: mockPhases)
        }

    
        
    func fetchCurrentLocation() {
        locationManager.requestLocation()
        fetchCurrentMonthData()
    }

    func fetchMoonData(lat: Double, lon: Double) {
        APIManager.shared.fetchMoonData(lat: lat, lon: lon) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.moonData = data.moon
                     // Update dynamically
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: Date())
    }
}

extension MoonViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        fetchMoonData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorMessage = error.localizedDescription
    }
}
