//
//  Colors.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import Foundation
import SwiftUI

/// Paleta fixa de 12 cores usadas no jogo.
struct GameColors {
    static let all: [GameColor] = [
        GameColor(name: String(localized: "Vermelho"), color: .red),
        GameColor(name: String(localized: "Azul"), color: .blue),
        GameColor(name: String(localized: "Verde"), color: .green),
        GameColor(name: String(localized: "Amarelo"), color: .yellow),
        GameColor(name: String(localized: "Laranja"), color: .orange),
        GameColor(name: String(localized: "Roxo"), color: .purple),
        GameColor(name: String(localized: "Rosa"), color: .pink),
        GameColor(name: String(localized: "Marrom"), color: .brown),
        GameColor(name: String(localized: "Ciano"), color: .cyan),
        GameColor(name: String(localized: "Cinza"), color: .gray),
        GameColor(name: String(localized: "Menta"), color: .mint),
        GameColor(name: String(localized: "Índigo"), color: .indigo)
    ]
}
