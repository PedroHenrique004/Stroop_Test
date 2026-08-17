//
//  GameEngineTests.swift
//  Stroop_TestTests
//
//  Created by Pedro Santos on 17/08/26.
//

import Testing
@testable import Stroop_Test_Watch_App

@MainActor
struct GameEngineTests {

    @Test
    func checkCorrectAnswer() async throws {
        
        // Arrange
        
        let state = UserState()
        let engine = GameEngine(userState: state)
        engine.generateRound()
        
        // Act
        
        let rightColor = engine.currentRound!.rightOption
        
        engine.checkAnswer(selectedColor: rightColor)
        
        // Assert 
        
        #expect(state.score == 1)
    }
    
    @Test
    func checkWrongAnswer() async throws {
        
        // Arrange
        
        let state = UserState()
        let engine = GameEngine(userState: state)
        engine.generateRound()
        
        // Act
        
        let rightColor = engine.currentRound!.rightOption
        
        // 1. .first(where: { ... }): Roda um loop na lista de 4 cores e retorna a primeira que passar na condição.
        // 2. $0: É uma abreviação do Swift que significa "O item atual do loop". (Nesse caso, cada cor da lista).
        // 3. $0.id != rightColor.id: A condição! O item atual do loop tem um ID diferente do ID da cor certa?
        // 4. "!": Como o 'first' pode não achar nada e devolver nulo (Optional), o "!" garante que ele ACHOU uma cor.
        let wrongColor = engine.currentRound!.roundColors.first(where: { $0.id != rightColor.id })!
        
        engine.checkAnswer(selectedColor: wrongColor)
        
        // Assert
        
        #expect(state.gameIsRunning == false)
    }

}
