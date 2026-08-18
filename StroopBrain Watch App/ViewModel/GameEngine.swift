//
//  GameEngine.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import Foundation

/// Orquestra o fluxo principal do jogo.
/// Pede novas rodadas ao `RoundGenerator`, consulta o `DifficultyManager` para o tempo,
/// controla o `RoundTimer`, atualiza a pontuação e decide o fim de jogo,
/// interagindo também com o `HighScoreRepository` para salvar recordes.
///
@Observable
class GameEngine {
    
    let roundGenerator = RoundGenerator()
    let roundTimer = RoundTimer()
    var currentRound: Round?
    
    var userState: UserState
    
    init(userState: UserState) {
        self.userState = userState
    }
    
    func generateRound() {
        
        let novaRodada = roundGenerator.generateRound(difficulty: userState.score)
        
        self.currentRound = novaRodada
        
        let tempoLimite = DifficultyManager.getDifficulty(score: userState.score)
        
        roundTimer.startTimer(duration: tempoLimite)
    }
    
    func checkAnswer(selectedColor: GameColor) {

        guard let round = currentRound else { return }
        

        if selectedColor.id == round.wordColor.id {
            userState.addScore()
            generateRound()
            
        } else {
            userState.endGame()
            userState.defeat()
            roundTimer.stopTimer()
        }
    }
    
    
    
}
