//
//  DifficultyManager.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import Foundation

/// Define o tempo limite da rodada atual (ex: 5s -> 3s -> 2s -> 1,5s)
/// com base na pontuação acumulada na run em andamento.
class DifficultyManager {

    static func getDifficulty(score: Int) -> Double {
        
        switch score {
            case 0...9:
                return 5.0
            case 10...19:
                return 3.0
            case 20...29:
                return 2.0
            case 30...:
                return 1.5
            default:
                return 5.0
            }
    }
    
}
