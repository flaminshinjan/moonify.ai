import SwiftUI

struct ChatTabView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var userInput: String = "" // Input text field
    @FocusState private var isInputFocused: Bool // State for keyboard dismissal

    var body: some View {
        VStack {
            // Chat history
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.messages) { message in
                            ChatBubble(message: message)
                                .id(message.id) // Assign unique IDs for scrolling
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    
                }
            }
            .background(Color.white)

            // Input field and send button
            HStack {
                TextField("I'm moonify.ai, what can I help you with?", text: $userInput)
                    .focused($isInputFocused) // Attach focus state
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(20)
                    

                Button(action: {
                    if !userInput.trimmingCharacters(in: .whitespaces).isEmpty {
                        viewModel.sendMessage(userInput)
                        userInput = "" // Clear input field
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.yellow)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .cornerRadius(16)
            
        }
        .onTapGesture {
            isInputFocused = false // Dismiss keyboard when tapping outside
        }
    }
}

struct ChatBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.sender == .bot {
                // Bot message on the left
                VStack(alignment: .leading) {
                    Text(message.content)
                        .padding(12)
                        .background(Color.yellow.opacity(0.9)) // Dark yellow for bot
                        .cornerRadius(16)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            } else {
                Spacer()
                // User message on the right
                VStack(alignment: .trailing) {
                    Text(message.content)
                        .padding(12)
                        .background(Color.yellow.opacity(0.5)) // Light yellow for user
                        .cornerRadius(16)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
        .padding(.horizontal, 10)
    }
}
