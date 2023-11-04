//
//  PokemonApi.swift
//  pokedex
//
//  Created by Renzo on 30/10/2023.
//

import Foundation

struct PokemonApi {
    
    let url : String = "https://pokeapi.co/api/v2/pokemon?limit=151";
    
    
    func getListOfPokemon(completion: @escaping (PokemonList?, Error?) -> Void) async  {
        await performAPICall(passedUrl: url) { data, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(PokemonList.self, from: data) {
                    completion(decodedData, nil)
                }
            } else if let error = error {
                print("something went wrong \(error)")
                completion(nil, error)
            }
        }
    }

    func getPokemonDetail(pokemonUrl: String, completion: @escaping (PokemonModel?, Error?) -> Void) async  {
        await performAPICall(passedUrl: pokemonUrl) { data, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(PokemonModel.self, from: data) {
                    completion(decodedData, nil)
                }
            } else if let error = error {
                print("something went wrong \(error)")
                completion(nil, error)
            }
        }
    }


    

    
    func performAPICall(passedUrl: String, completion: @escaping (Data?, Error?) -> Void) async {
        if let url = URL(string: passedUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                } else if let data = data {
                    completion(data, nil)
                }
            }
            task.resume()
        }
    }
    
}
