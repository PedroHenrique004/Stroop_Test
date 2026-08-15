//
//  StartGame.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftUI

struct StartGame: View {
    @State private var isButtonAnimating = false
    
    let titleColors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]
    let title = Array("STROOP")
    
    var body: some View {
        NavigationStack {
            ZStack {

                Color.black.ignoresSafeArea()
                
                VStack(spacing: 12) {
                    Spacer()
                    
                    VStack(spacing: -2) {
                        HStack(spacing: 2) {
                            ForEach(0..<title.count, id: \.self) { index in
                                Text(String(title[index]))
                                    .font(.system(size: 26, weight: .black, design: .rounded))
                                    .foregroundColor(titleColors[index % titleColors.count])
                            }
                        }
                        
                        Text("TEST")
                            .font(.system(size: 24, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .opacity(0.9)
                    }
                    
                    Spacer()
                    
                    Text("Treine seu cérebro")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                    
                    NavigationLink {
                        Game()
                    } label: {
                        HStack {
                            Image(systemName: "play.fill")
                                .font(.system(size: 16, weight: .bold))
                            Text("JOGAR")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            LinearGradient(
                                colors: [.mint, .cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(25)
                        .shadow(color: .cyan.opacity(0.6), radius: isButtonAnimating ? 8 : 2, x: 0, y: 0)
                        .scaleEffect(isButtonAnimating ? 1.03 : 1.0)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 10)
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                    isButtonAnimating = true
                }
            }
        }
    }
}

#Preview {
    StartGame()
}
