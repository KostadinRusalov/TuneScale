//
//  StopsManager.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import SwiftUI

struct StopsManager {
    static func create(_ item: Stop) throws {
        let stopManager = StopManager()
        do {
            try stopManager.create(item)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    static func read() -> FetchedResults<Stop> {
        let stopManager = StopManager()
        return stopManager.stops
    }
    static func update(_ oldItem: Stop, newItem: Stop) throws {
        let stopManager = StopManager()
        do {
            try stopManager.update(oldItem, newItem)
        } catch {
            let error = error as NSError
            throw error
        }
    }
    
    static func delete(_ item: Stop) throws {
        let stopManager = StopManager()
        do {
            try stopManager.delete(item)

        } catch {
            let error = error as NSError
            throw error
        }
    }
}
