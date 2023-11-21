//
//  WeaknessTileContainer.swift
//  pokedex
//
//  Created by Renzo on 16/11/2023.
//

import SwiftUI

struct WeaknessTileContainer: View {
    var elements : [TypeElement]
    var body: some View {
        LazyVGrid (
            columns: [
                GridItem(.flexible(minimum: 100, maximum: 200)),
                GridItem(.flexible(minimum: 100, maximum: 200))
            ],
            spacing: 5)  {
                ForEach(elements, id: \.id) { index in
                    ElementTile(type: index.type)
                }
            }
    }
}
