//  TagsView.swift
//  Notes
//
//  Created by Abbas on 30/05/2025.

import SwiftUI

struct TagsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var allTags: [String]
    
    @State private var newTag: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Spacer()

            // New Tag Input
            HStack(spacing: 12) {
                TextField("New category...", text: $newTag)
                    .font(.system(size: 16, design: .monospaced))
                    .padding(.vertical, 10)
                    .background(Color.clear)
                    .foregroundColor(.black)
                    .overlay(Rectangle().frame(height: 1).padding(.top, 35), alignment: .bottom)

                Button(action: {
                    let trimmed = newTag.trimmingCharacters(in: .whitespaces)
                    if !trimmed.isEmpty && !allTags.contains(trimmed) {
                        allTags.append(trimmed)
                        newTag = ""
                    }
                }) {
                    Text("ADD")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal)

            // Section Title
            Text("YOUR TAGS")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(.gray)
                .padding(.horizontal)

            // Tag List
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(allTags, id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 16, design: .monospaced))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 14)
                            .padding(.horizontal)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(16)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, 4)
            }

            Spacer()
        }
        .background(Color(white: 0.92).ignoresSafeArea())
    }
}
