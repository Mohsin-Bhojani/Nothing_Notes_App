//  HomeView.swift
//  Notes
//
//  Created by Abbas on 26/05/2025.


import SwiftUI

struct HomeView: View {
    @State private var isMenuOpen = false
    @State private var selectedMenu: String = "Notes"
    @State private var selectedTag: String = "All"
    @State private var isShowingNewNoteView = false
    //@State private var isPresentingNewNote 


    @State private var notes: [Note] = [
        Note(title: "Grocery List", content: "Buy milk, eggs, bread", date: Date(), tags: ["Personal"]),
        Note(title: "Project Plan", content: "Outline sprint tasks", date: Date(), tags: ["Work"]),
        Note(title: "App Idea", content: "Habit tracker for students", date: Date(), tags: ["Ideas"]),
        Note(title: "Reminder", content: "Submit tax documents", date: Date(), tags: ["Urgent"]),
    ]

    let tags = ["All", "Work", "Personal", "Ideas", "Urgent"]

    var filteredNotes: [Note] {
        selectedTag == "All" ? notes : notes.filter { $0.tags.contains(selectedTag) }
    }

    var body: some View {
        ZStack(alignment: .leading) {
            NavigationView {
                VStack {
                    // Top Bar
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut) { isMenuOpen.toggle() }
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

                    // Tag Filter Bar
                    TagFilterBar(tags: tags, selectedTag: $selectedTag)

                    // Notes List
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredNotes) { note in
                                NoteTile(note: note)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 80)
                    }
                    .background(Color(.systemBackground))
                }
                .navigationBarHidden(true)
            }
            .disabled(isMenuOpen)

            if isMenuOpen {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.easeInOut) { isMenuOpen = false }
                    }
            }

            SideMenu(selectedMenu: $selectedMenu, isOpen: $isMenuOpen)
                .offset(x: isMenuOpen ? 0 : -250)
                .animation(.easeInOut, value: isMenuOpen)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isShowingNewNoteView = true
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
                    .sheet(isPresented: $isShowingNewNoteView) {
                        NewNoteView(notes: $notes)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
