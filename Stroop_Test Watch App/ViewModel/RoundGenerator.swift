//
//  RoundGenerator.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import Foundation

/// Monta cada rodada do jogo.
/// Sorteia 4 cores entre a paleta fixa, define aleatoriamente qual é a "cor certa" (alvo do toque)
/// e qual delas será usada como o texto da palavra exibida.
class RoundGenerator {
    
    func generateRound(difficulty: Int) -> Round{
        
        let options = Array(GameColors.all.shuffled().prefix(4))
        
        let word = options.randomElement()!
        
        let rightOption: GameColor = options.randomElement()!
        
        let newRound = Round(difficulty: difficulty, roundColors: options, wordColor: word, rightOption: rightOption)
        
        return newRound
    }
    
}
