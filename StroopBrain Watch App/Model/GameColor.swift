//
//  GameColor.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import Foundation
import SwiftUI

/// Representa uma das 12 cores fixas usadas no jogo.
/// É um dado estático e não persistido, usado para desenhar os botões e a palavra na tela.
class GameColor: Identifiable{
    
    var id = UUID()
    var name: String
    var color: Color
    
    init(id: UUID = UUID(), name: String, color: Color) {
        self.id = id
        self.name = name
        self.color = color
    }
    
}
