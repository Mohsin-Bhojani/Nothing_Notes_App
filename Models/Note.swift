//  Note.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.

import Foundation

// MARK: - Note Model
struct Note: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: Date
    let tags: [String]
}
