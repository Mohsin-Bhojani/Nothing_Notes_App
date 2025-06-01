//  Untitled.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.


import SwiftUI

@main
struct NotesApp: App {
    @StateObject private var colorSchemeManager = ColorSchemeManager()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(colorSchemeManager)
                .preferredColorScheme(colorSchemeManager.isDarkMode ? .dark : .light)
                .accentColor(.red)
        }
    }
}

