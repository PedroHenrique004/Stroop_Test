//
//  Game.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftUI

struct Game: View {
    
    // Inicializamos o estado e o motor do jogo para esta partida
    @State private var userState: UserState
    @State private var gameEngine: GameEngine
    
    init() {
        let state = UserState()
        state.startGame() 
        _userState = State(initialValue: state)
        _gameEngine = State(initialValue: GameEngine(userState: state))
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if userState.gameIsRunning {
                PlayingView(userState: userState, gameEngine: gameEngine)
            } else {
                GameOverView(userState: userState, gameEngine: gameEngine)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            userState.score = 0
            userState.startGame()
        }
    }
}

#Preview {
    Game()
}
