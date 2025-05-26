//  HomeView.swift
//  Notes
//
//  Created by Abbas on 26/05/2025.

import SwiftUI

struct HomeView: View {
    @State private var isMenuOpen = false
    @State private var selectedMenu: String = "Notes"
    @State private var selectedTag: String = "All"
    
    
    let tags = ["All", "Work", "Personal", "Ideas", "Urgent"] // Example tags

    var body: some View {
        ZStack(alignment: .leading) {
            // Main Content
            NavigationView {
                VStack {
                    // Top Bar
                    HStack {
                        // Menu Button
                        Button(action: {
                            withAnimation(.easeInOut) {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                        }

                        Spacer()

                        // Center Title
                        Text("Notes writing")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)

                        Spacer()

                        // Settings Button
                        Button(action: {
                            // TODO: Open settings
                        }) {
                            Image(systemName: "gearshape")
                                .imageScale(.large)
                        }
                    }
                    .padding()
                    
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
                    
                    Spacer()

                    // Placeholder
                    Text("Your notes will appear here")
                        .foregroundColor(.gray)
                    
                    .background(Color(.systemBackground))

                }
                .navigationBarHidden(true)
            }
            .disabled(isMenuOpen)

            // Dimmed background
            if isMenuOpen {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isMenuOpen = false
                        }
                    }
            }

            // Slide-in Side Menu
            SideMenu(selectedMenu: $selectedMenu, isOpen: $isMenuOpen)
                .offset(x: isMenuOpen ? 0 : -250) // Slide in/out from the left
                .animation(.easeInOut, value: isMenuOpen)
        }
    }
}
struct SideMenu: View {
    @Binding var selectedMenu: String
    @Binding var isOpen: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 100)

            // Notes Button
            Button(action: {
                selectedMenu = "Notes"
                withAnimation {
                    isOpen = false
                }
            }) {
                HStack {
                    Text("Notes")
                        .font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }

            // Tags Button
            Button(action: {
                selectedMenu = "Tags"
                withAnimation {
                    isOpen = false
                }
            }) {
                HStack {
                    Text("Tags")
                        .font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
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
