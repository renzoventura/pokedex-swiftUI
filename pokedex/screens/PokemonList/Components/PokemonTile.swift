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
                    Text("\(String(pokemon.id)). \(String(pokemon.name.capitalized))")
                        .font(.title2)
                        .fontWeight(.semibold)

                    ElementTileContainer(elements: pokemon.types)
                }
                Spacer()
                PokemonTileImageContainer(pokemon: pokemon)
                
            }
            .padding(.vertical, 2)
            .padding(.leading, 20)
        }.cornerRadius(20)
    }
}


