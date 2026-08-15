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
        GameColor(name: "Vermelho", color: .red),
        GameColor(name: "Azul", color: .blue),
        GameColor(name: "Verde", color: .green),
        GameColor(name: "Amarelo", color: .yellow),
        GameColor(name: "Laranja", color: .orange),
        GameColor(name: "Roxo", color: .purple),
        GameColor(name: "Rosa", color: .pink),
        GameColor(name: "Marrom", color: .brown),
        GameColor(name: "Ciano", color: .cyan),
        GameColor(name: "Cinza", color: .gray),
        GameColor(name: "Menta", color: .mint),
        GameColor(name: "Índigo", color: .indigo)
    ]
}
