//
//  PokemonListViewModel.swift
//  pokedex
//
//  Created by Renzo on 27/10/2023.
//

import Foundation
import Combine


class PokemonListViewModel: ObservableObject {
    let api = PokemonApi()
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var pokemonDetailList: [PokemonModel] = []
    @Published var isLoading: Bool = false // Added isLoading property
    
    func getListOfPokemonUrls()  {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true before making the API call
        }
        api.getListOfPokemon() { data, error in
            if let data = data {
                self.getListOfPokemonDetails(pokemonListPassed: data)
            } else if error != nil {}
        }
    }
    
    func getListOfPokemonDetails(pokemonListPassed: PokemonList)   {
        let pokemonURLs = pokemonListPassed.results.map { $0.url };
        let publishers = pokemonURLs.map { url in
            URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
                .map(\.data)
                .decode(type: PokemonModel.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
        Publishers.MergeMany(publishers) // Merge the individual publishers
            .collect()
            .receive(on: DispatchQueue.main) // Make sure to update UI on the main thread
            .sink { completion in
                switch completion {
                case .finished:
                    self.isLoading = false // Set isLoading to false once the API call is complete
                case .failure(let error):
                    print("API request failed: \(error)")
                    self.isLoading = false // Set isLoading to false in case of failure
                }
            } receiveValue: { results in
                // Handle the received data
                print(results.count)
                DispatchQueue.main.async {
                    self.pokemonDetailList = results
                    self.pokemonDetailList.sort { $1.id > $0.id }
                }
            }
            .store(in: &cancellables)
    }
}
