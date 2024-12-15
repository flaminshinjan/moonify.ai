import SwiftUI

struct MoonDataCard: View {
    let moonData: MoonData

    var body: some View {
        VStack(spacing: 20) {
            // Moon Emoji
            Text(moonData.emoji)
                .font(.system(size: 120))
                .padding()
                .background(Color.white.opacity(0.8))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)

            // Moon Details
            VStack(alignment: .center, spacing: 10) {
                Text(moonData.phase_name)
                    .font(.system(size: 30))
                    .bold()
                Text("Illumination: \(moonData.illumination)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Moonrise: \(moonData.moonrise)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Moonset: \(moonData.moonset)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 50) // Add padding inside details
        }
        .padding() // Add padding inside the card
        .frame(maxWidth: .infinity) // Take the full width of the parent
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
    }
}
