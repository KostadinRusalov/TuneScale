//
//  NoteManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI

struct NoteManager: IDB {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    typealias Item = Note
    
    func create(_ item: Note) throws {
        do {
            let note = Note(context: viewContext)
            note.id = item.id
            note.tone = item.tone
            note.index = item.index
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved error: \(error)")
        }
    }
    
    func update(_ oldItem: FetchedResults<Note>.Element, _ newItem: Note) throws {
        do {
            oldItem.id = newItem.id
            oldItem.tone = newItem.tone
            oldItem.index = newItem.index
            try viewContext.save()
        } catch  {
            let error = error as NSError
            fatalError("Unresolved error: \(error)")
        }
    }
    
    func delete(at offsets: IndexSet) throws {
        do {
            offsets.map { notes[$0] }.forEach(viewContext.delete)
            try viewContext.save()
        } catch {
            let error = error as NSError
            throw error
        }
    }
}
