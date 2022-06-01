//
//  HeartApp.swift
//  Heart
//
//  Created by Anton Gorodetsky on 28.05.2022.
//

import SwiftUI

@main
struct HeartApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(clock: ClockModel())
//            .environmentObject(Clock())
        }
    }
}

