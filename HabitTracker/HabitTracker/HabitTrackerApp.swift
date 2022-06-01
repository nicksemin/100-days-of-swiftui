//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Nick Semin on 25.03.2022.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    
    @StateObject private var hobbyManager = HobbyListManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(hobbyManager: hobbyManager)
        }
    }
}
