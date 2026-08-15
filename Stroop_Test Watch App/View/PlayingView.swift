//
//  PlayingView.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftUI

struct PlayingView: View {
    var userState: UserState
    var gameEngine: GameEngine
    
    var body: some View {
        VStack(spacing: 8) {
            
            HStack {
                Text("Score: \(userState.score)")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(String(format: "%.1fs", gameEngine.roundTimer.secondsRemaining))
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(gameEngine.roundTimer.secondsRemaining <= 1.5 ? .red : .white)
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            if let round = gameEngine.currentRound {
                Text(round.wordColor.name.uppercased())
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundColor(round.rightOption.color)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .padding(.horizontal)
            } else {
                Text("PREPARAR...")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if let round = gameEngine.currentRound {
                VStack(spacing: 6) {
                    HStack(spacing: 6) {
                        ColorButton(gameColor: round.roundColors[0]) {
                            gameEngine.checkAnswer(selectedColor: round.roundColors[0])
                        }
                        ColorButton(gameColor: round.roundColors[1]) {
                            gameEngine.checkAnswer(selectedColor: round.roundColors[1])
                        }
                    }
                    HStack(spacing: 6) {
                        ColorButton(gameColor: round.roundColors[2]) {
                            gameEngine.checkAnswer(selectedColor: round.roundColors[2])
                        }
                        ColorButton(gameColor: round.roundColors[3]) {
                            gameEngine.checkAnswer(selectedColor: round.roundColors[3])
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
            }
        }
        .onAppear {
            gameEngine.generateRound()
        }
        .onChange(of: gameEngine.roundTimer.timeIsOver) { _, tempoAcabou in
            if tempoAcabou {
                userState.endGame()
                userState.defeat()
            }
        }
    }
}

#Preview("PlayingView Preview") {
    let previewUserState = UserState()
    let previewGameEngine = GameEngine(userState: previewUserState)
    return PlayingView(userState: previewUserState, gameEngine: previewGameEngine)
}
