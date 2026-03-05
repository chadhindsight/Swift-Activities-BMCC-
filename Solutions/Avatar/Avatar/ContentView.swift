//
//  ContentView.swift
//  Avatar
//
//  Created by chadhindsight on 2/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Head
            Capsule()
                .frame(width: 250, height: 300)
                .foregroundStyle(Color.brown)
            
            // Neck
            Rectangle()
                .frame(width: 80, height: 130)
                .offset(y: 200)
                .foregroundStyle(Color.brown)
            
            // Shirt
            RoundedRectangle(cornerRadius: 70)
                .frame(width: 330, height: 230)
                .offset(y: 380)
                .foregroundStyle(Color.indigo)
            
            Circle()
                .trim(from: 0.5, to: 1.0)
                .frame(width: 280)
                .offset(y: -50)
        }
        .padding()
    }

}

#Preview {
    ContentView()
}

