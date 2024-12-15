import Foundation

struct ChatMessage: Identifiable {
    let id = UUID() // Unique ID for each message
    let sender: Sender
    let content: String
}

enum Sender {
    case user
    case bot
}
