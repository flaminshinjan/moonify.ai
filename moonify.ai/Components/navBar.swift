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
            Spacer()
            
            // Moon Tab
            Button(action: {
                selectedTab = .moon
            }) {
                VStack {
                    Image(systemName: "moon.stars.fill")
                        .font(.title2)
                        .foregroundColor(selectedTab == .moon ? .blue : .gray)
                    Text("Moon")
                        .font(.caption)
                        .foregroundColor(selectedTab == .moon ? .blue : .gray)
                }
            }
            
            Spacer()
            
            // Chat Tab
            Button(action: {
                selectedTab = .chat
            }) {
                VStack {
                    Image(systemName: "message.fill")
                        .font(.title2)
                        .foregroundColor(selectedTab == .chat ? .blue : .gray)
                    Text("Chat")
                        .font(.caption)
                        .foregroundColor(selectedTab == .chat ? .blue : .gray)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
}
