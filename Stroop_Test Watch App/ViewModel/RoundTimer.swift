//
//  RoundTimer.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import Foundation
import SwiftUI

/// Controla a contagem regressiva de cada rodada.
/// Dispara um evento de "tempo esgotado" caso o jogador não toque a tempo.
@Observable
class RoundTimer {
    var secondsRemaining: Double = 0.0
    var timeIsOver: Bool = false
    
    private var timer: Timer?
    
    func startTimer(duration: Double) {
        stopTimer()
        self.timeIsOver = false
        self.secondsRemaining = duration
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.secondsRemaining -= 0.1
            
            if self.secondsRemaining <= 0 {
                self.secondsRemaining = 0.0
                self.timeIsOver = true
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
