//
//  PokemonImage.swift
//  pokedex
//
//  Created by Renzo on 8/11/2023.
//

import SwiftUI

struct PokemonImage: View {
    var pokemonImage: String
    var body: some View {
        AsyncImage(url: URL(string: pokemonImage)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
            case .failure(let error):
                Text("Failed to load image: \(error.localizedDescription)")
            @unknown default:
                Text("Unknown state")
            }
        }
    }
}

