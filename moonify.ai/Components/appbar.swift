import SwiftUI

struct AppBar: ViewModifier {
    let title: String
    let profileImage: String

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Image(title)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(.horizontal, 50)

                Spacer()

                // Profile Image
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 20) // Add 20-point padding to the left and right
            .padding(.vertical, 10) // Optional: Add vertical padding

            content
        }
    }
}

extension View {
    func appBar(title: String, profileImage: String) -> some View {
        self.modifier(AppBar(title: title, profileImage: profileImage))
    }
}

                    
