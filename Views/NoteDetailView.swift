//  NoteDetailView.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    @ObservedObject var viewModel: NotesViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let image = note.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 250)
                        .cornerRadius(10)
                }

                Text(note.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text("Category: \(note.category)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(note.content)
                    .font(.body)
                    .padding(.top, 8)

                Text("Created at: \(formattedDate(note.createdAt))")
                    .font(.footnote)
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Note Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

