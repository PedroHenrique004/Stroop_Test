//
//  HighScore.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import Foundation
import SwiftData

/// Guarda o recorde pessoal do jogador.
/// Esta entidade será persistida localmente para manter a maior pontuação alcançada.
///
@Model
class HighScore {
    
    var bestScore: Int
    var achievedAt: Date
    
    init(bestScore: Int, achievedAt: Date) {
        self.bestScore = bestScore
        self.achievedAt = achievedAt
    }
}
