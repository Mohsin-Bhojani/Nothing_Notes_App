//  AddNoteView.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: NotesViewModel

    @State private var title = ""
    @State private var content = ""
    @State private var category = ""
    @State private var image: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }

                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(height: 150)
                }

                Section(header: Text("Category")) {
                    TextField("Enter category", text: $category)
                }

                Section(header: Text("Image")) {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(8)
                    }
                    Button("Choose Image") {
                        showImagePicker = true
                    }
                }
            }
            .navigationTitle("Add Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let note = Note(
                            id: UUID(),
                            title: title,
                            content: content,
                            category: category,
                            imageData: image?.jpegData(compressionQuality: 0.8),
                            createdAt: Date()
                        )
                        viewModel.addNote(note)
                        dismiss()
                    }
                    .disabled(title.isEmpty || content.isEmpty)
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $image)
            }
        }
    }
}

