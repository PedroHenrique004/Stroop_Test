//
//  Stroop_TestApp.swift
//  Stroop_Test Watch App
//
//  Created by Pedro Santos on 14/08/26.
//

import SwiftUI
import SwiftData

@main
struct Stroop_Test_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            StartGame()
        }
        .modelContainer(for: HighScore.self)
    }
}
