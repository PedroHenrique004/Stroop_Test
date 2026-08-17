//
//  GameOverView.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftUI
import SwiftData

struct GameOverView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query private var highScores: [HighScore]
    
    var userState: UserState
    var gameEngine: GameEngine
    
    @State private var animateScale = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.red.opacity(0.4), Color.black]),
                center: .center,
                startRadius: 10,
                endRadius: 100
            )
            .ignoresSafeArea()
            
            VStack(spacing: 4) {
                
                Spacer()
                
                Image(systemName: "xmark.octagon.fill")
                    .font(.system(size: 26))
                    .foregroundColor(.red)
                    .shadow(color: .red.opacity(0.8), radius: animateScale ? 5 : 0)
                    .scaleEffect(animateScale ? 1.1 : 0.9)
                    .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: animateScale)
                
                Text("GAME OVER")
                    .font(.system(size: 16, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                    .tracking(1.5)
                
                HStack(alignment: .lastTextBaseline, spacing: 2) {
                    Text("\(userState.score)")
                        .font(.system(size: 38, weight: .heavy, design: .rounded))
                        .foregroundColor(.yellow)
                    Text("pts")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                if let melhor = highScores.first?.bestScore {
                    Text("Recorde: \(max(melhor, userState.score))")
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundColor(.white.opacity(0.5))
                }
                
                Spacer()
                
                HStack(spacing: 8) {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 16))
                            .frame(width: 44, height: 44)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        userState.score = 0
                        userState.startGame()
                        gameEngine.generateRound()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.system(size: 14, weight: .bold))
                            Text("REPETIR")
                                .font(.system(size: 14, weight: .black, design: .rounded))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 44)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
            }
        }
        .onAppear {
            animateScale = true
            let repo = HighScoreRepository(context: context)
            repo.updateHighScore(newScore: userState.score)
        }
    }
}

#Preview {
    // Apenas para o preview não quebrar sem um banco de dados falso
    GameOverView(userState: UserState(), gameEngine: GameEngine(userState: UserState()))
}
