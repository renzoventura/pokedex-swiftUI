//
//  PokemonListScreen.swift
//  pokedex
//
//  Created by Renzo on 27/10/2023.
//

import Foundation
import SwiftUI
import Combine

struct PokemonListScreen: View {
    @EnvironmentObject var vm: PokemonListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.isLoading {
                    // Show loading indicator
                    ProgressView("Loading...")
                } else {
                    List(vm.pokemonDetailList, id: \.id) { pokemon in
                        PokemonTile(pokemon: pokemon)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .overlay(
                                NavigationLink("", destination: PokemonDetailScreen(pokemon: pokemon))
                                    .opacity(0)
                            )
                    }
                    .onAppear() {
                        vm.getListOfPokemonUrls()
                    }
                    .navigationTitle("Pokédex")
                }
            }.listStyle(.plain)
        }
    }
    
    
    struct PokemonListScreen_Previews: PreviewProvider {
        static var previews: some View {
            PokemonListScreen()
        }
    }
    
}


