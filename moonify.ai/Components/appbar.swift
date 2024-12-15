//
//  appbar.swift
//  moonify.ai
//
//  Created by Shinjan Patra on 15/12/24.
//

import SwiftUI

struct AppBar: ViewModifier {
    let title: String
    let profileImage: String // Provide a profile image asset name

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding()
            .background(Color.white.shadow(radius: 3))
            
            content
        }
    }
}
