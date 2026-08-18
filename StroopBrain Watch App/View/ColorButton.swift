//
//  ColorButton.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftUI

struct ColorButton: View {
    let gameColor: GameColor
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 12)
                .fill(gameColor.color)
                .frame(maxWidth: .infinity, maxHeight: 40)
        }
        .buttonStyle(.plain)
        .accessibilityIdentifier("ColorButton_\(gameColor.name)")
    }
}
