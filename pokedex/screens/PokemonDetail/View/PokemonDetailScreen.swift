//
//  PokemonDetailScreen.swift
//  pokedex
//
//  Created by Renzo on 8/11/2023.
//

import SwiftUI

struct PokemonDetailScreen: View {
    var pokemon : PokemonModel
    var body: some View {
        PokemonImage(pokemonImage: pokemon.sprites.other.home.frontDefault)
            .frame(width: 400, height: 400)
    
    }
}
