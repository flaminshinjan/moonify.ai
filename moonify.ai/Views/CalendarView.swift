import SwiftUI

struct MoonCalendarView: View {
    @StateObject private var viewModel = MoonCalendarViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if viewModel.isLoading {
                    ProgressView("Loading Calendar...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Display each month's data
                            ForEach(viewModel.calendarData, id: \.month) { monthData in
                                VStack(alignment: .leading, spacing: 10) {
                                    // Month title
                                    Text(monthData.month)
                                        .font(.headline)
                                        .padding(.bottom, 5)

                                    // Moon phases with dates
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 20) {
                                            ForEach(0..<monthData.phases.count, id: \.self) { index in
                                                VStack {
                                                    // Date above the moon emoji
                                                    Text("\(index + 1)")
                                                        .font(.caption)
                                                        .foregroundColor(.gray)

                                                    // Moon emoji
                                                    Text(monthData.phases[index])
                                                        .font(.largeTitle)
                                                        .padding(8)
                                                        .background(Color.white)
                                                        .cornerRadius(10)
                                                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.yellow.opacity(0.2))
                                .cornerRadius(12)
                            }
                        }
                        .padding()
                    }
                }
            }
            
            .onAppear {
                viewModel.fetchMoonCalendar()
            }
        }
    }
}
