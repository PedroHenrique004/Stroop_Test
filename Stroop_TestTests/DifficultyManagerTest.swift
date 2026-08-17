//
//  DifficultyManagerTest.swift
//  Stroop_TestTests
//
//  Created by Pedro Santos on 17/08/26.
//


import Testing
@testable import Stroop_Test_Watch_App

/// O @MainActor avisa ao compilador do Swift 6 que estes testes
/// têm permissão para rodar na "Thread Principal" (a mesma thread da interface de usuário).
/// Sem isso, os testes rodariam em threads secundárias (background threads) para serem mais rápidos.
/// Como o nosso app interage com o SwiftUI e com as telas, a Apple exige (pelo Strict Concurrency)
/// que classes atreladas à UI só sejam tocadas pela Thread Principal para evitar colisões.
@MainActor
struct DifficultyManagerTest {

    @Test("Testing difficulty when score is 0")
    func testScoreZero() async throws {
        let time = DifficultyManager.getDifficulty(score: 0)
        
        #expect(time == 5.0)
    }
    
    @Test("Testing difficulty when score is 10")
    func testScoreTen() async throws {
        let time = DifficultyManager.getDifficulty(score: 10)
        
        #expect(time == 3.0)
    }
    
    @Test("Testing difficulty when score is 20")
    func testScoreTwenty() async throws {
        let time = DifficultyManager.getDifficulty(score: 20)
        
        #expect(time == 2.0)
    }
    
    @Test("Testing difficulty when score is 30")
    func testScoreThirty() async throws {
        let time = DifficultyManager.getDifficulty(score: 30)
        
        #expect(time == 1.5)
    }


}

