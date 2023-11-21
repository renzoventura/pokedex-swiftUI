//
//  ElementTileContainer.swift
//  pokedex
//
//  Created by Renzo on 16/11/2023.
//

import SwiftUI

struct ElementTileContainer: View {
    var elements : [TypeElement]
    var body: some View {
        HStack (spacing: 5)  {
            ForEach(elements, id: \.id) { index in
                ElementTile(type: index.type)
            }
        }
    }
}
