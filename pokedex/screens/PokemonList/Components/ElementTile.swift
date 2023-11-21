//
//  ElementTile.swift
//  pokedex
//
//  Created by Renzo on 5/11/2023.
//

import SwiftUI


struct ElementTile: View {
    var type : Species
    var body: some View {
        HStack(spacing: 5) {
            ElementIcon(type: type.name)
            Text(type.name.capitalized)
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.semibold)
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(getColorForType(type: type.name)
                     )
        )
    }
}
