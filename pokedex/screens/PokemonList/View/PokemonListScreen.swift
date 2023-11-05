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
            
            
            List(vm.pokemonDetailList, id: \.id) { pokemon in
                PokemonTile(pokemon: pokemon).listRowSeparator(.hidden)
                
            }
            
            
            .onAppear() {
                vm.getListOfPokemonUrls()
            }
            .navigationTitle("Pokédex")
        }.listStyle(.plain)
    }
    
    
    struct PokemonListScreen_Previews: PreviewProvider {
        static var previews: some View {
            PokemonListScreen()
        }
    }
    
}


