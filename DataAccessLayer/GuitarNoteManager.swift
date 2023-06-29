//
//  GuitarNoteManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI

struct GuitarNoteManager: IDB {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var guitarNotes: FetchedResults<GuitarNote>
    typealias Item = GuitarNote
    
    func create(_ item: GuitarNote) throws {
        do {
            let note = GuitarNote(context: viewContext)
            note.guitarString = item.guitarString
            note.fret = item.fret
            try viewContext.save()
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    func update(_ oldItem: FetchedResults<GuitarNote>.Element, _ newItem: GuitarNote) throws {
        do {
            oldItem.guitarString = newItem.guitarString
            oldItem.fret = newItem.fret
            try viewContext.save()
        } catch  {
            let error = error as NSError
            throw error
        }
    }
    
    func delete(at offsets: IndexSet) throws {
        do {
            offsets.map { guitarNotes[$0] }.forEach(viewContext.delete)
            try viewContext.save()
        } catch {
            let error = error as NSError
            throw error
        }
    }
}
