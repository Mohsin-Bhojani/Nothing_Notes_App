//  NotesViewModel.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.
/*
import Foundation
import SwiftUI
// import CoreData // Uncomment when ready to use Core Data

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []

    private let notesKey = "saved_notes"

    init() {
        loadNotes()
    }

    // MARK: - UserDefaults (Active)
    
    func loadNotes() {
        guard let data = UserDefaults.standard.data(forKey: notesKey) else { return }
        do {
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            print("Failed to decode notes: \(error)")
        }
    }

    func saveNotes() {
        do {
            let data = try JSONEncoder().encode(notes)
            UserDefaults.standard.set(data, forKey: notesKey)
        } catch {
            print("Failed to encode notes: \(error)")
        }
    }

    func addNote(_ note: Note) {
        notes.append(note)
        saveNotes()
    }

    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        saveNotes()
    }

    func updateNote(_ updatedNote: Note) {
        if let index = notes.firstIndex(where: { $0.id == updatedNote.id }) {
            notes[index] = updatedNote
            saveNotes()
        }
    }

    // MARK: - Core Data (Commented Out)
    
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "NotesModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        fetchNotes()
    }

    func fetchNotes() {
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        do {
            let entities = try container.viewContext.fetch(request)
            notes = entities.map { entity in
                Note(
                    id: entity.id ?? UUID(),
                    title: entity.title ?? "",
                    content: entity.content ?? "",
                    category: entity.category ?? "",
                    imageData: entity.imageData,
                    createdAt: entity.createdAt ?? Date()
                )
            }
        } catch {
            print("Failed to fetch notes: \(error.localizedDescription)")
        }
    }

    func addNoteCoreData(_ note: Note) {
        let newEntity = NoteEntity(context: container.viewContext)
        newEntity.id = note.id
        newEntity.title = note.title
        newEntity.content = note.content
        newEntity.category = note.category
        newEntity.imageData = note.imageData
        newEntity.createdAt = note.createdAt
        saveContext()
        fetchNotes()
    }

    func saveContext() {
        do {
            try container.viewContext.save()
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }

    func deleteNoteCoreData(note: Note) {
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        request.predicate = NSPredicate(format: "id == %@", note.id as CVarArg)
        do {
            let results = try container.viewContext.fetch(request)
            results.forEach { container.viewContext.delete($0) }
            saveContext()
            fetchNotes()
        } catch {
            print("Failed to delete note: \(error.localizedDescription)")
        }
    }
    */
