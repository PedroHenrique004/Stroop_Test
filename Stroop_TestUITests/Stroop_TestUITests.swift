//
//  Stroop_TestUITests.swift
//  Stroop_TestUITests
//
//  Created by Pedro Santos on 17/08/26.
//

import XCTest

final class Stroop_TestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        XCUIApplication().launch()
    }
    
    func testStartGameView() throws {
        let app = XCUIApplication()
        
        let startButton = app.buttons["JOGAR"]
        
        let text = app.staticTexts["Treine seu cérebro"]
        
        XCTAssertTrue(text.exists)
        XCTAssertTrue(startButton.exists)
         
    }
    
    func testHomeButton() throws {
        let app = XCUIApplication()
        
        let playButton = app.buttons["JOGAR"]
        
        playButton.tap()
        
        sleep(6)
        
        let gameOverText = app.staticTexts["GAME OVER"]
        XCTAssertTrue(gameOverText.exists)
        
        let homeButton = app.buttons["HomeButton"]
        homeButton.tap()
        
        XCTAssertTrue(playButton.exists)
    }
    
    func testResetButton() throws {
        let app = XCUIApplication()
        
        let playButton = app.buttons["JOGAR"]
        
        playButton.tap()
        
        sleep(6)
        
        let gameOverText = app.staticTexts["GAME OVER"]
        XCTAssertTrue(gameOverText.exists)
        
        let resetButton = app.buttons["REPETIR"]
        let startAgainPoints = app.staticTexts["Pontos: 0"]

        
        resetButton.tap()
        XCTAssertTrue(startAgainPoints.exists)
    }

    func testStartGameNavigation() throws {
        let app = XCUIApplication()
        
        let startButton = app.buttons["JOGAR"]
        
        startButton.tap()
        
        let text = app.staticTexts["Pontos: 0"]
        
        XCTAssertTrue(text.exists)
         
    }
    
    func testhighScore() throws {
        let app = XCUIApplication()
        let playButton = app.buttons["JOGAR"]
        
        playButton.tap()
        sleep(6)
        
        // Faço assim pra procurar por um trecho de algo
        let filtroDeRecorde = NSPredicate(format: "label CONTAINS 'Recorde:'")
        
        let recordeText = app.staticTexts.element(matching: filtroDeRecorde)
        
        XCTAssertTrue(recordeText.exists)
    }
    
    func testTapColorButton() throws {
        let app = XCUIApplication()
        let playButton = app.buttons["JOGAR"]
        
        playButton.tap()
        
        let startAgainPoints = app.staticTexts["Pontos: 0"]
        XCTAssertTrue(startAgainPoints.exists)
        
        let filtroDeCores = NSPredicate(format: "identifier BEGINSWITH 'ColorButton_'")
        
        let primeiroBotaoColorido = app.buttons.element(matching: filtroDeCores).firstMatch

        primeiroBotaoColorido.tap()
        
        // Esperar um pouco antes de validar
        let marcouPonto = app.staticTexts["Pontos: 1"].waitForExistence(timeout: 1.0)
        let deuGameOver = app.staticTexts["GAME OVER"].waitForExistence(timeout: 1.0)
        
        // Teste de duas opções possíveis
        XCTAssertTrue(marcouPonto || deuGameOver)
    }
    
}
