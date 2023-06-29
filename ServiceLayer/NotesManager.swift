//
//  NotesManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI
struct NotesManager {
    static func create(_ item: Note) throws {
        let noteManager = NoteManager()
        do {
            try noteManager.create(item)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    static func read() -> FetchedResults<Note> {
        NoteManager().notes
    }
    
    static func update(_ oldItem: Note, newItem: Note) throws {
        let noteManager = NoteManager()
        do {
            try noteManager.update(oldItem, newItem)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    static func delete(_ item: Note) throws {
        let noteManager = NoteManager()
        do {
            try noteManager.delete(item)

        } catch {
            let error = error as NSError
            throw error
        }
    }
}
