//
//  GuitarNotesManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI

struct GuitarNotesManager {
    static func create(_ item: GuitarNote) throws {
        let noteManager = GuitarNoteManager()
        do {
            try noteManager.create(item)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    static func read() -> FetchedResults<GuitarNote> {
        let noteManager = GuitarNoteManager()
        return noteManager.guitarNotes
    }
    static func update(_ oldItem: GuitarNote, newItem: GuitarNote) throws {
        let noteManager = GuitarNoteManager()
        do {
            try noteManager.update(oldItem, newItem)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    static func delete(_ item: GuitarNote) throws {
        let noteManager = GuitarNoteManager()
        do {
            try noteManager.delete(item)

        } catch {
            let error = error as NSError
            throw error
        }
    }
}
