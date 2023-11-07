//
//  ElementIcon.swift
//  pokedex
//
//  Created by Renzo on 8/11/2023.
//

import SwiftUI

struct ElementIcon: View {
    var type : String
    var body: some View {
        ZStack {
            Ellipse()
                .fill(Color.white)
                .frame(width: 25, height: 25)
            Image(getElementImage(type: type))
                .resizable()
                .frame(width: 13, height: 13)
        }
    }
}

