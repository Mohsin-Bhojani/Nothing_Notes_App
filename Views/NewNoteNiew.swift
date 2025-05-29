//  AddNoteView.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.

import SwiftUI

struct NewNoteView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var notes: [Note]

    @State private var title: String = ""
    @State private var content: String = ""
    @State private var selectedTags: [String] = []

    @State private var allTags = ["Work", "Personal", "Ideas", "Urgent"]
    @State private var isTagPickerPresented = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {

                // Top Bar
                HStack {
                    Button(action: {
                        if !title.isEmpty || !content.isEmpty {
                            let newNote = Note(
                                title: title,
                                content: content,
                                date: Date(),
                                tags: selectedTags
                            )
                            notes.insert(newNote, at: 0)
                        }
                        dismiss()
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                            Text("Save")
                                .fontWeight(.semibold)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)

                // Title Input
                TextField("Title", text: $title)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.horizontal)

                // Tag Row
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(selectedTags, id: \.self) { tag in
                            HStack(spacing: 6) {
                                Text(tag)
                                    .font(.subheadline)
                                    .foregroundColor(.white)

                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .imageScale(.small)
                                    .onTapGesture {
                                        selectedTags.removeAll { $0 == tag }
                                    }
                            }
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Capsule().fill(Color.accentColor))
                        }

                        Button(action: {
                            isTagPickerPresented = true
                        }) {
                            Label("Add New Tag", systemImage: "tag")
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(Capsule().fill(Color(.secondarySystemBackground)))
                        }
                    }
                    .padding(.horizontal)
                }

                // Content Editor (fills remaining space, scrolls internally)
                TextEditor(text: $content)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .frame(maxHeight: .infinity)

            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isTagPickerPresented) {
                TagPickerView(
                    tags: $allTags,
                    selectedTags: $selectedTags,
                    isPresented: $isTagPickerPresented
                )
                .presentationDetents([.fraction(0.5)])
            }
        }
    }
}
