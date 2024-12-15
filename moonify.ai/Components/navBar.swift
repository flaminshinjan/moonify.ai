//
//  navBar.swift
//  moonify.ai
//
//  Created by Shinjan Patra on 15/12/24.
//

import SwiftUI

struct FloatingNavBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            // Moon Tab Button
            NavBarItem(
                imageName: "moon.fill",
                
                isSelected: selectedTab == .moon,
                selectedColor: .yellow,
                action: { selectedTab = .moon }
            )

            Spacer() // Fixed space between buttons

            // Chat Tab Button
            NavBarItem(
                imageName: "message.fill",
                
                isSelected: selectedTab == .chat,
                selectedColor: .yellow,
                action: { selectedTab = .chat }
            )

            Spacer() // Fixed space between buttons

            // Lunar Calendar Tab Button
            NavBarItem(
                imageName: "calendar",
                
                isSelected: selectedTab == .calendar,
                selectedColor: .yellow,
                action: { selectedTab = .calendar }
            )
            Spacer() 
            NavBarItem(
                imageName: "person.circle",
                
                isSelected: selectedTab == .calendar,
                selectedColor: .yellow,
                action: { selectedTab = .calendar }
            )
            
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(25)
        .padding(.horizontal, 15)
        .padding(.bottom, 10)
    }
}

struct NavBarItem: View {
    let imageName: String
    
    let isSelected: Bool
    let selectedColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Image(systemName: imageName)
                    .font(.title2)
                    .foregroundColor(isSelected ? selectedColor : .gray)
                
            }
        }
    }
}
