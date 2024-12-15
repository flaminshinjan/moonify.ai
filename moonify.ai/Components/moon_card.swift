//
//  moon_card.swift
//  moonify.ai
//
//  Created by Shinjan Patra on 15/12/24.
//

import SwiftUI

struct MoonDataCard: View {
    let moonData: MoonData
    
    var body: some View {
        VStack(spacing: 15) {
            // Emoji for Moon Phase
            Text(moonData.emoji)
                .font(.system(size: 60))
            
            // Moon Phase Name
            Text(moonData.phase_name)
                .font(.headline)
                .bold()
                .foregroundColor(.black)
            
            // Illumination
            Text("Illumination: \(moonData.illumination)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Moonrise and Moonset
            Text("Moonrise: \(moonData.moonrise)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Moonset: \(moonData.moonset)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
    }
}


