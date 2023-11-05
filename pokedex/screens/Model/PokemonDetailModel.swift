// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PokemonModel: Codable, Identifiable {
    let id: Int
    let name: String
    let species: Species
    let types: [TypeElement]
    let sprites: Sprites
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case species
        case types
        case sprites
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species
    let id : UUID
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        slot = try container.decode(Int.self, forKey: .slot)
        type = try container.decode(Species.self, forKey: .type)
        id = UUID()
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let frontDefault : String;
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
