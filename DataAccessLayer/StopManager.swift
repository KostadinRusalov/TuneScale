//
//  StopManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI

struct StopManager: IDB {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var stops: FetchedResults<Stop>
    typealias Item = Stop
    
    func create(_ item: Stop) throws {
        do {
            let note = Stop(context: viewContext)
            note.id = item.id
            note.guitarNotes = item.guitarNotes
            note.notes = item.notes
            try viewContext.save()
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    func update(_ oldItem: FetchedResults<Stop>.Element, _ newItem: Stop) throws {
        do {
            oldItem.id = newItem.id
            oldItem.guitarNotes = newItem.guitarNotes
            oldItem.notes = newItem.notes
            try viewContext.save()
        } catch  {
            let error = error as NSError
            throw error
        }
    }
    
    func delete(at offsets: IndexSet) throws {
        do {
            offsets.map { stops[$0] }.forEach(viewContext.delete)
            try viewContext.save()
        } catch {
            let error = error as NSError
            throw error
        }
    }
}

