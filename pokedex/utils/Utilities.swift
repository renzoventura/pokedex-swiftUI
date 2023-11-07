//
//  Utilities.swift
//  pokedex
//
//  Created by Renzo on 5/11/2023.
//

import Foundation
import SwiftUI

let typeColors: [String: Color] = [
    C.normalType: Color(hex: 0x919AA2),
    C.fightingType: Color(hex: 0xCE416B),
    C.flyingType: Color(hex: 0x89AAE3),
    C.poisonType: Color(hex: 0xB567CE),
    C.groundType: Color(hex: 0xC5B78C),
    C.rockType: Color(hex: 0xD97845),
    C.bugType: Color(hex: 0x91C12F),
    C.ghostType: Color(hex: 0x5269AD),
    C.steelType: Color(hex: 0x5A8EA2),
    C.fireType: Color(hex: 0xFF9D55),
    C.waterType: Color(hex: 0x5090D6),
    C.grassType: Color(hex: 0x63BC5A),
    C.electricType: Color(hex: 0xF4D23C),
    C.psychicType: Color(hex: 0xFA7179),
    C.iceType: Color(hex: 0x73CEC0),
    C.dragonType: Color(hex: 0x0B6DC3),
    C.darkType: Color(hex: 0x5A5465),
    C.fairyType: Color(hex: 0xEC8FE6),
    C.unknownType: .gray,
    C.shadowType: .black
]

func getElementImage(type: String) -> String {
    let path = "\(type)"
    return path
    
}

func getColorForType( type: String?) -> Color {
    if let color = typeColors[type ?? "Unknown"] {
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


//func getColorForTypeTransparent2( type: String?) -> Color {
//    if let color = typeColors[type ?? "Unknown"] {
//        return color.opacity(0.5)
//    } else {
//        return .gray
//    }
//}



extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
