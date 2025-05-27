//  HomeView.swift
//  Notes
//
//  Created by Abbas on 26/05/2025.

import SwiftUI

// MARK: - Note Model
struct Note: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: Date
    let tags: [String]
}

// MARK: - Home View
struct HomeView: View {
    @State private var isMenuOpen = false
    @State private var selectedMenu: String = "Notes"
    @State private var selectedTag: String = "All"
    
    @State private var notes: [Note] = [
        Note(title: "Grocery List", content: "Buy milk, eggs, bread", date: Date(), tags: ["Personal"]),
        Note(title: "Project Plan", content: "Outline sprint tasks", date: Date(), tags: ["Work"]),
        Note(title: "App Idea", content: "Habit tracker for students", date: Date(), tags: ["Ideas"]),
        Note(title: "Reminder", content: "Submit tax documents", date: Date(), tags: ["Urgent"]),
    ]
    
    let tags = ["All", "Work", "Personal", "Ideas", "Urgent"]
    
    // MARK: - Filtered Notes Computed Property
    var filteredNotes: [Note] {
        if selectedTag == "All" {
            return notes
        } else {
            return notes.filter { $0.tags.contains(selectedTag) }
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Main Content
            NavigationView {
                VStack {
                    // Top Bar
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                        }
                        
                        Spacer()
                        
                        Text("Notes")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Button(action: {
                            // TODO: Open settings
                        }) {
                            Image(systemName: "gearshape")
                                .imageScale(.large)
                        }
                    }
                    .padding()
                    
                    // Tag Bar
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
                    
                    // Notes List
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredNotes) { note in
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
                                .frame(maxWidth: .infinity, alignment: .leading) // ← important
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 80) // Leave space for floating button
                    }
                    .background(Color(.systemBackground))
                }
                .navigationBarHidden(true)
            }
            .disabled(isMenuOpen)
            
            // Dim Background When Menu Is Open
            if isMenuOpen {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isMenuOpen = false
                        }
                    }
            }
            
            // Slide-in Menu
            SideMenu(selectedMenu: $selectedMenu, isOpen: $isMenuOpen)
                .offset(x: isMenuOpen ? 0 : -250)
                .animation(.easeInOut, value: isMenuOpen)
            
            // Floating Add Button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // TODO: Open New Note View
                    }) {
                        Text("New Note")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 14)
                            .background(Color.red)
                            .cornerRadius(14)
                            .shadow(radius: 4)
                    }
                    .padding()
                }
            }
        }
    }
}

// MARK: - Side Menu View
struct SideMenu: View {
    @Binding var selectedMenu: String
    @Binding var isOpen: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 100)
            
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

#Preview {
    HomeView()
}
