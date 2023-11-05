//
//  Utilities.swift
//  pokedex
//
//  Created by Renzo on 5/11/2023.
//

import Foundation
import SwiftUI

let typeColors: [String: Color] = [
    "normal": .gray,
    "fighting": .red,
    "flying": .blue,
    "poison": .purple,
    "ground": .brown,
    "rock": .orange,
    "bug": .green,
    "ghost": .black,
    "steel": .gray,
    "fire": .red,
    "water": .blue,
    "grass": .green,
    "electric": .yellow,
    "psychic": .pink,
    "ice": .cyan,
    "dragon": .purple,
    "dark": .black,
    "fairy": .pink,
    "unknown": .gray,
    "shadow": .black
]

func getColorForType( type: String) -> Color {
    if let color = typeColors[type] {
        return color
    } else {
        return .gray
    }
}


func getColorForTypeTransparent( type: String?) -> Color {
    if let color = typeColors[type ?? "Unknown"] {
        return color.opacity(0.15)
    } else {
        return .gray
    }
}
