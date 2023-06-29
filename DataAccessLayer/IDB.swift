//
//  IDB.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import Foundation

protocol IDB {
    associatedtype Item
    func create(_ item: Item) throws
    func update(_ oldItem: Item, _ newItem: Item) throws
    func delete(at offsets: IndexSet) throws
}
