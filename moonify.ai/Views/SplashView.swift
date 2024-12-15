//
//  SplashView.swift
//  moonify.ai
//
//  Created by Shinjan Patra on 15/12/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false // Control navigation to the main app view

    var body: some View {
        if isActive {
            MoonView() // Navigate to the main MoonView
        } else {
            ZStack {
                Color.white.ignoresSafeArea() // White background
                
                VStack {
                    Image("logo") // Replace "logo" with your actual asset name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200) // Adjust size as needed
                }
            }
            .onAppear {
                // Navigate to the main view after a delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
