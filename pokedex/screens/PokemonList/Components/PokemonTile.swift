//
//  PokemonTile.swift
//  pokedex
//
//  Created by Renzo on 5/11/2023.
//

import SwiftUI

struct PokemonTile: View {
    var pokemon : PokemonModel;
    var body: some View {
        ZStack {
            getColorForTypeTransparent(type: pokemon.types.first?.type.name)
                         .ignoresSafeArea()
            HStack {
                VStack (alignment: .leading){
                    Text("\(String(pokemon.id)) \(String(pokemon.name.capitalized))")
                    ElementTileContainer(elements: pokemon.types)
                }
                Spacer()
                AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 100)
                    case .failure(let error):
                        Text("Failed to load image: \(error.localizedDescription)")
                    @unknown default:
                        Text("Unknown state")
                    }
                }
            }
            .padding(.vertical, 2)
            .padding(.leading, 20)
        }.cornerRadius(20)
    }
}


