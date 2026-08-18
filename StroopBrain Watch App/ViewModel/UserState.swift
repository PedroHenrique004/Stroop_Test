//
//  UserState.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftUI
import WatchKit

@Observable
class UserState {
    var gameIsRunning: Bool = false
    var score: Int = 0
    
    func sucess(){
        WKInterfaceDevice.current().play(.success)
    }
    
    func defeat(){
        WKInterfaceDevice.current().play(.failure)
    }
    
    func addScore(){
        score += 1
        sucess()
    }
    
    func startGame(){
        gameIsRunning = true
    }
    
    func endGame(){
        gameIsRunning = false
    }
}

