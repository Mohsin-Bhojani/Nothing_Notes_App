//  NoteTitle.swift
//  Notes
//
//  Created by Abbas on 29/05/2025.

import SwiftUI

struct NoteTile: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(note.title)
                .font(.headline)
            Text(note.content)
                .font(.subheadline)
                .lineLimit(2)
                .foregroundColor(.secondary)
            Text(note.date, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
    }
}

