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
        ScrollView {
            VStack(alignment: .leading) {
                PokemonImage(pokemonImage: pokemon.sprites.other.home.frontDefault)
                    .frame(width: 400, height: 400)
                VStack(alignment: .leading){
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(String(pokemon.id))
                        .font(.title3).fontWeight(.semibold)
                    ElementTileContainer(elements: pokemon.types)
                    Divider()
                    WeaknessTileContainer(elements: pokemon.types)
                } .padding()
                
            }
        }
        
        
    }
}
