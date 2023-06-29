//
//  SongsManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI

struct SongsManager {
    static func create(_ item: Song) throws {
        let songManager = SongManager()
        do {
            try songManager.create(item)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    static func read() -> FetchedResults<Song> {
        let songManager = SongManager()
        return songManager.songs
    }
    static func update(_ oldItem: Song, newItem: Song) throws {
        let songManager = SongManager()
        do {
            try songManager.update(oldItem, newItem)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    static func delete( at offsets: IndexSet) throws {
        let songManager = SongManager()
        do {
            try songManager.delete(at: offsets)
        } catch  {
            let error = error as NSError
            throw error
        }
    }
}
