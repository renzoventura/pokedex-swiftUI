//
//  PokemonListViewModel.swift
//  pokedex
//
//  Created by Renzo on 27/10/2023.
//

import Foundation


class PokemonListViewModel: ObservableObject {
    let api = PokemonApi()
    
    @Published var pokemonDetailList: [PokemonModel] = []
    
    func getListOfPokemonUrls()  {
        api.getListOfPokemon() { data, error in
            if let data = data {
                DispatchQueue.main.async {
                    
                    self.getListOfPokemonDetails(pokemonListPassed: data)
                }
            } else if error != nil {}
        }
        
        
    }
    
    func getListOfPokemonDetails(pokemonListPassed: PokemonList)   {
        let pokemonURLs = pokemonListPassed.results.map { $0.url };
        print("CALLING THE LIST OF POKEMON!!! \(String(describing: pokemonURLs.count))")
        
        
        var pokemonList: [PokemonModel] = []
        
        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue.global()
        for url in pokemonURLs  {
            dispatchGroup.enter()
            
            api.getPokemonDetail(pokemonUrl: url) { data, error in
                
                if let data = data {
                    print(data.name)
                    pokemonList.append(data);
                    
                } else if error != nil {
                    print("Something went wrong for URL")
                }
                dispatchGroup.leave()
            }
        }
        
        print("THIS IS IT! \(String(describing: pokemonListPassed.count))")
        
        print("------------------------0");
        dispatchGroup.notify(queue: queue) {
            
            print("------------------------1");
            if !pokemonList.isEmpty {
                
                print("------------------------2");
                self.pokemonDetailList = pokemonList;
            } else {
                print("------------------------3");
            }
        }
    }
}
