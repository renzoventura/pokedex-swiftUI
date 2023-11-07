//
//  PokemonTileImageContainer.swift
//  pokedex
//
//  Created by Renzo on 8/11/2023.
//

import SwiftUI

struct PokemonTileImageContainer: View {
    var pokemon : PokemonModel
    var body: some View {
        ZStack {
            Image(getElementImage(type: pokemon.types.first?.type.name ?? ""))
                .resizable()
                .frame(width: 70, height: 70)
                .padding()
            PokemonImage(pokemonImage: pokemon.sprites.frontDefault)
        }
        .background(getColorForTypeTransparent(type: pokemon.types.first?.type.name))
        .cornerRadius(20)
    }
    
}
