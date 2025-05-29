//  SideMenu.swift
//  Notes
//
//  Created by Abbas on 29/05/2025.

import SwiftUI

struct SideMenu: View {
    @Binding var selectedMenu: String
    @Binding var isOpen: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 100)

            Button(action: {
                selectedMenu = "Notes"
                withAnimation { isOpen = false }
            }) {
                HStack {
                    Text("Notes").font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.gray)
                }
                .padding(.horizontal)
            }

            Button(action: {
                selectedMenu = "Tags"
                withAnimation { isOpen = false }
            }) {
                HStack {
                    Text("Tags").font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.gray)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .frame(width: 250)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.vertical)
        .shadow(radius: 5)
    }
}
