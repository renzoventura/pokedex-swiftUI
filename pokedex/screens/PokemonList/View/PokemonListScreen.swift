//
//  PokemonListScreen.swift
//  pokedex
//
//  Created by Renzo on 27/10/2023.
//

import SwiftUI

struct PokemonListScreen: View {
    @EnvironmentObject var vm: PokemonListViewModel

    var body: some View {
        NavigationView {
            List(vm.pokemonDetailList, id: \.id) { pokemon in
                NavigationLink(destination: Text("Details for \(pokemon.name)")) {
                    Text(pokemon.name.capitalized)
                }
            }
            .onAppear() {
                 vm.getListOfPokemonUrls()
            }
            .navigationTitle("Pokédex")
        }
    }
    
    struct PokemonListScreen_Previews: PreviewProvider {
        static var previews: some View {
            PokemonListScreen()
        }
    }
    
}
