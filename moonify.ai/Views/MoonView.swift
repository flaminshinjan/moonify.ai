import SwiftUI

struct MoonView: View {
    @StateObject private var viewModel = MoonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBlue).ignoresSafeArea()
                if let moonData = viewModel.moonData {
                    VStack(spacing: 20) {
                        Text(moonData.emoji)
                            .font(.system(size: 80))
                        
                        Text(moonData.phase_name)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("Illumination: \(moonData.illumination)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Text("Moonrise: \(moonData.moonrise)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Text("Moonset: \(moonData.moonset)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                } else {
                    ProgressView("Fetching Moon Data...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
            .navigationTitle("Moon Phase")
            .onAppear {
                viewModel.fetchCurrentLocation()
            }
        }
    }
}
