//
//  PokemonCard.swift
//  PokemonCard
//
//  Created by Chad Hinds on 3/12/26.
//

import SwiftUI

// our own custom view
struct PokemonCard: View {
    
    let imageName: String
    let name: String
    let hp: Int
    let attackName: String
    let damage: Int
    let attackDescription: String
    let type: String
    let pokemonDescription: String
    
    // Switch statement used to determine the background color of a card
    var backgroundColor: Color {
        switch type {
        case "Fire":
            return .orange
        case "Electric":
            return .yellow
        case "Grass/Poison":
            return .green
        case "Psychic":
            return .purple
        case "Normal/Flying":
            return .gray
        default:
            return .yellow
        }
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            // Top row
            HStack {
                Text(name)
                    .font(.headline)
                
                Spacer()
                
                Text("HP \(hp)")
                    .font(.subheadline)
            }
            
            // Pokemon image
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
            
            Divider()
            
            // Attack name + damage
            HStack {
                Text(attackName)
                    .font(.subheadline)
                    .bold()
                
                Spacer()
                
                Text("\(damage)")
                    .bold()
            }
            
            // Attack description
            Text(attackDescription)
                .font(.caption)
                .multilineTextAlignment(.leading)
            
            Divider()
            
            // Pokemon description (flavor text)
            Text(pokemonDescription)
                .font(.caption2)
                .italic()
                .multilineTextAlignment(.leading)
            
        }
        .padding()
        .background(backgroundColor.opacity(0.4))
        .cornerRadius(12)
        .frame(width: 220)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 4) )
    }
}

