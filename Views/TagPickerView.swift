//  TagPickerView.swift
//  Notes
//
//  Created by Abbas on 29/05/2025.

import SwiftUI

struct TagPickerView: View {
    @Binding var tags: [String]
    @Binding var selectedTags: [String]
    @Binding var isPresented: Bool
    
    @State private var searchText: String = ""

    var body: some View {
        VStack(spacing: 0) {
            // Drag indicator
            Capsule()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 6)
                .padding(.top, 8)

            // Header
            Text("Select Tags")
                .font(.headline)
                .padding(.top, 4)

            // Search + Add Tag
            HStack {
                TextField("Search or add tag", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !trimmed.isEmpty && !tags.contains(trimmed) {
                        tags.append(trimmed)
                        selectedTags.append(trimmed)
                        searchText = ""
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.accentColor)
                        .font(.title2)
                }
            }
            .padding()

            // List of Tags
            List {
                ForEach(tags.filter {
                    searchText.isEmpty || $0.localizedCaseInsensitiveContains(searchText)
                }, id: \.self) { tag in
                    HStack {
                        Text(tag)
                        Spacer()
                        Button(action: {
                            if selectedTags.contains(tag) {
                                selectedTags.removeAll { $0 == tag }
                            } else {
                                selectedTags.append(tag)
                            }
                        }) {
                            Image(systemName: selectedTags.contains(tag) ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(.accentColor)
                        }
                    }
                    .contentShape(Rectangle()) // Makes the whole row tappable
                }
            }
            .listStyle(.plain)
        }
        .presentationDetents([.fraction(0.5)])
        .presentationDragIndicator(.visible)
    }
}
