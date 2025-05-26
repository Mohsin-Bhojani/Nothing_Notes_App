//  NotesListView.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.
/*
import SwiftUI

struct NotesListView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var showAddNote = false
    @State private var selectedNote: Note? = nil

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    Button {
                        selectedNote = note
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .lineLimit(1)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .navigationTitle("My Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddNote = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(item: $selectedNote) { note in
                NoteDetailView(note: note, viewModel: viewModel)
            }
            .sheet(isPresented: $showAddNote) {
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}
*/
