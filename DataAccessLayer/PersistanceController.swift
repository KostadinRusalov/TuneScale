//
//  PersistanceController.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation
import CoreData

struct PersistanceController {
    static let shared = PersistanceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TuneScale")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
            
        }
    }
}
