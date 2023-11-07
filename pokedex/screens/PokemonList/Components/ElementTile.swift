//
//  ElementTile.swift
//  pokedex
//
//  Created by Renzo on 5/11/2023.
//

import SwiftUI

struct ElementTileContainer: View {
    var elements : [TypeElement]
    var body: some View {
        HStack {
            ForEach(elements, id: \.id) { index in
                ElementTile(type: index.type)
            }
        }
    }
}

struct ElementTile: View {
    var type : Species
    var body: some View {
        HStack {
            ElementIcon(type: type.name)
            Text(type.name.capitalized)
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.bold)
            
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
