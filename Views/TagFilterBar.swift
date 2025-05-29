//  TagFilterBar.swift
//  Notes
//
//  Created by Abbas on 29/05/2025.

import SwiftUI

struct TagFilterBar: View {
    let tags: [String]
    @Binding var selectedTag: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedTag == tag ? Color.accentColor : Color(.secondarySystemBackground))
                        )
                        .foregroundColor(selectedTag == tag ? .white : .primary)
                        .onTapGesture {
                            selectedTag = tag
                        }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}
