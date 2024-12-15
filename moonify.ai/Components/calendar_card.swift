//
//  calendar_card.swift
//  moonify.ai
//
//  Created by Shinjan Patra on 15/12/24.
//

import SwiftUI

struct CurrentMonthCalendarCard: View {
    let monthName: String
    let phases: [String]
    let currentDate: Int // Current date (e.g., 15 for the 15th of the month)

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Month name
            Text(monthName)
                .font(.headline)
                .padding(.bottom, 5)
                .padding(.horizontal)

            // Horizontal scroll for moon phases with dates
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<phases.count, id: \.self) { index in
                        VStack {
                            // Date above the moon emoji
                            Text("\(index + 1)") // Day of the month
                                .font(.caption)
                                .foregroundColor(index + 1 == currentDate ? .blue : .gray)
                                .bold(index + 1 == currentDate)

                            // Moon emoji
                            Text(phases[index])
                                .font(.largeTitle)
                                .padding(8)
                                .background(
                                    index + 1 == currentDate
                                        ? Color.blue.opacity(0.2) // Highlight background
                                        : Color.white
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(10)
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(12)
    }
}
