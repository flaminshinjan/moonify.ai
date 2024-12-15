import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = [] // Chat history
    @Published var isLoading: Bool = false // Loading state for API calls

   
    func sendMessage(_ text: String) {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        // Append the user's message to the chat history
        let userMessage = ChatMessage(sender: .user, content: text)
        messages.append(userMessage)

        // Start loading and make API call
        isLoading = true
        fetchResponse(for: text)
    }

    private func fetchResponse(for prompt: String) {
        guard let url = URL(string: apiURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // GPT-4 API request body
        let body: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                ["role": "user", "content": prompt]
            ],
            "max_tokens": 150,
            "temperature": 0.7
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            }

            if let error = error {
                print("API Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else { return }

            do {
                let responseData = try JSONDecoder().decode(GPTResponse.self, from: data)
                if let botReply = responseData.choices.first?.message.content {
                    DispatchQueue.main.async {
                        let botMessage = ChatMessage(sender: .bot, content: botReply)
                        self?.messages.append(botMessage)
                    }
                }
            } catch {
                print("Decoding Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct GPTResponse: Decodable {
    let choices: [GPTChoice]
}

struct GPTChoice: Decodable {
    let message: GPTMessage
}

struct GPTMessage: Decodable {
    let content: String
}
