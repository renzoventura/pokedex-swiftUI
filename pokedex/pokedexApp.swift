//
//  pokedexApp.swift
//  pokedex
//
//  Created by Renzo on 27/10/2023.
//

import SwiftUI
import Foundation


@main
struct pokedexApp: App {
    @StateObject var pokemonListViewModel = PokemonListViewModel()

    var body: some Scene {
        WindowGroup {
            PokemonListScreen().environmentObject(pokemonListViewModel);

        }
    }
}




