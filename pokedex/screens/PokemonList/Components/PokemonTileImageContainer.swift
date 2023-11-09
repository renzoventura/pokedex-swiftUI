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
                .padding()
            PokemonImage(pokemonImage: pokemon.sprites.frontDefault)
        }
        .frame(
            width: 120
            )
        .background(getColorForTypeTransparent(type: pokemon.types.first?.type.name))
        .cornerRadius(20)
    }
    
}
