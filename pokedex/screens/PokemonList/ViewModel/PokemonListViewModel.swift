//
//  PokemonListViewModel.swift
//  pokedex
//
//  Created by Renzo on 27/10/2023.
//

import Foundation


class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: PokemonList?
    var listOfUrls : [URL?] = [];
    
    @Published var pokemonDetailList: [PokemonModel?] = []
    let api = PokemonApi()

    
    func getPokemonList() async {
        await api.getListOfPokemon() { data, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.pokemonList = data;
                }
            } else if error != nil {
                print("SOMETHING WENT WRONG!");
            }
        }
    }
    
    func getListOfPokemon() async  {
        let pokemonURLs = listOfUrls;
        var pokemonList: [PokemonModel] = []
        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue.global()
        for url in pokemonURLs {
            dispatchGroup.enter()
            
            await api.getPokemonDetail(pokemonUrl: url?.absoluteString ?? "") { data, error in
                defer {
                    dispatchGroup.leave()
                }
                if let data = data {
                    pokemonList.append(data);
                } else if error != nil {
                    print("Something went wrong for URL")
                }
            }
        }
        
        dispatchGroup.notify(queue: queue) {
            if !pokemonList.isEmpty {
                print("IT WORKED!!!");
                self.pokemonDetailList = pokemonList;
            } else {
            }
        }
    }
}
