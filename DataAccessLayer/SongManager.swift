//
//  SongManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI

struct SongManager: IDB {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var songs: FetchedResults<Song>
    typealias Item = Song
    
    func create(_ item: Song) throws {
        do {
            let note = Song(context: viewContext)
            note.id = item.id
            note.name = item.name
            note.capo = item.capo
            note.stops = item.stops
            note.notes = item.notes
            try viewContext.save()
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    func update(_ oldItem: FetchedResults<Song>.Element, _ newItem: Song) throws {
        do {
            oldItem.id = newItem.id
            oldItem.name = newItem.name
            oldItem.capo = newItem.capo
            oldItem.stops = newItem.stops
            oldItem.notes = newItem.notes
            try viewContext.save()
        } catch  {
            let error = error as NSError
            throw error
        }
    }
    
    func delete(at offsets: IndexSet) throws {
        do {
            offsets.map { songs[$0] }.forEach(viewContext.delete)
            try viewContext.save()
        } catch {
            let error = error as NSError
            throw error
        }
    }
}

