// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PokemonList: Codable {
    let count: Int
    let next: String
//    let previous: [Result]?
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id : UUID
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)

        // Generate a UUID for the id property
        id = UUID()
    }
}
