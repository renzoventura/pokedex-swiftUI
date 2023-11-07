//
//  Utilities.swift
//  pokedex
//
//  Created by Renzo on 5/11/2023.
//

import Foundation
import SwiftUI

let typeColors: [String: Color] = [
    C.normalType: .gray,
    C.fightingType: .red,
    C.flyingType: Color(
        red: Double(0x89) / 255.0,
        green: Double(0xAA) / 255.0,
        blue: Double(0xE3) / 255.0
    ),
    C.poisonType: .purple,
    C.groundType: .brown,
    C.rockType: .orange,
    C.bugType: .green,
    C.ghostType: .black,
    C.steelType: .gray,
    C.fireType: .red,
    C.waterType: .blue,
    C.grassType: .green,
    C.electricType: .yellow,
    C.psychicType: .pink,
    C.iceType: .cyan,
    C.dragonType: .purple,
    C.darkType: .black,
    C.fairyType: .pink,
    C.unknownType: .gray,
    C.shadowType: .black
]

func getElementImage(type: String) -> String {
    let path = "\(type)"
    return path
    
}

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
