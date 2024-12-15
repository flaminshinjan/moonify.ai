import SwiftUI

struct MoonView: View {
    @StateObject private var viewModel = MoonViewModel()
    @State private var selectedTab: Tab = .moon
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                VStack {
                    if selectedTab == .moon {
                        if let moonData = viewModel.moonData {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    MoonDataCard(moonData: moonData)
                                        .frame(width: 300)
                                        .padding(.horizontal)
                                }
                                .padding(.top, 20)
                            }
                        } else if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding()
                        } else {
                            ProgressView("Fetching Moon Data...")
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                    } else if selectedTab == .chat {
                        ChatTabView()
                    }
                    
                    Spacer()
                    
                    FloatingNavBar(selectedTab: $selectedTab)
                }
                .onAppear {
                    viewModel.fetchCurrentLocation()
                }
            }
            .modifier(AppBar(title: "moonify.ai", profileImage: "profile_placeholder"))
        }
    }
}

enum Tab {
    case moon, chat
}
