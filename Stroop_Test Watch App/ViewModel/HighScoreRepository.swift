//
//  HighScoreRepository.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftData
import Foundation

/// Camada de persistência local (ex: UserDefaults ou SwiftData).
/// Responsável apenas por ler e gravar a entidade `HighScore`.
class HighScoreRepository {
    
    // O repositorio precisa acessar o banco de dados
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchHighScore() -> HighScore? {
        
        let descriptor = FetchDescriptor<HighScore>()

        let result = try? context.fetch(descriptor)
        
        let highScore: HighScore? = result?.first
        
        return highScore
    }
    
    func updateHighScore(newScore: Int) {
        
        let actualHS = fetchHighScore()
        
        if let existing = actualHS {
            
            if existing.bestScore < newScore {
                existing.bestScore = newScore
                existing.achievedAt = Date()
            }
        }
        else {
            let newHighScore = HighScore(bestScore: newScore, achievedAt: Date())
            context.insert(newHighScore)
        }
        
        try? context.save()
        
    }
}
