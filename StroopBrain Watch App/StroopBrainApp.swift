//
//  StroopBrainApp.swift
//  StroopBrain Watch App
//
//  Created by Pedro Santos on 17/08/26.
//

import SwiftUI
import SwiftData

@main
struct StroopBrain_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            StartGame()
        }
        .modelContainer(for: HighScore.self)
    }
}
