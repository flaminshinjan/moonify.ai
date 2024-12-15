import SwiftUI

struct MoonView: View {
    @StateObject private var viewModel = MoonViewModel()
    @State private var selectedTab: Tab = .moon

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if selectedTab == .moon {
                        if let moonData = viewModel.moonData {
                            VStack(spacing: 20) {
                                // Dynamic location and date
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Current Location")
                                            .font(.title2)
                                            .bold()
                                        Text(viewModel.formattedDate)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal)

                                // Moon Details Card
                                ScrollView(.horizontal, showsIndicators: true){
                                    VStack(spacing: 20) {
                                        MoonDataCard(moonData: moonData)
                                            .padding(.horizontal, 20) // Add padding to the card
                                    }
                                }

                                // Current Month Calendar Card
                                if let calendarData = viewModel.currentMonthData {
                                    CurrentMonthCalendarCard(
                                        monthName: calendarData.month,
                                        phases: calendarData.phases,
                                        currentDate: viewModel.currentDate
                                    ).padding(20)
                                }
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
                    } else if selectedTab == .calendar {
                        MoonCalendarView()
                    }
                    
                    Spacer()
                    
                    FloatingNavBar(selectedTab: $selectedTab).padding()
                }
                .onAppear {
                    viewModel.fetchCurrentLocation()
                }
            }
            .modifier(AppBar(title: "logo", profileImage: "profile_image"))
        }
    }
}

enum Tab {
    case moon, chat, calendar
}
