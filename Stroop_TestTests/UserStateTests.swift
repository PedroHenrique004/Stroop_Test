//
//  UserStateTests.swift
//  Stroop_TestTests
//
//  Created by Pedro Santos on 17/08/26.
//

import Testing
@testable import Stroop_Test_Watch_App


@MainActor
struct UserStateTests {

    @Test("testing UserState initial value")
    func initialValue() async throws {

        let state = UserState()
        
        #expect(state.score == 0)
        #expect(state.gameIsRunning == false)
    }
    
    @Test("Testing AddScore function")
    func addScore() async throws {
        let state = UserState()
        
        state.addScore()
        
        #expect(state.score == 1)
    }
    
    @Test("Testing startGame function")
    func startGame() async throws {
        
        let state = UserState()
        state.startGame()
        
        #expect(state.gameIsRunning == true)
    }
    
    @Test("Testing endGame function")
    func endGame() async throws {
        
        let state = UserState()
        state.startGame()
        state.endGame()
        
        #expect(state.gameIsRunning == false)
    }

}
