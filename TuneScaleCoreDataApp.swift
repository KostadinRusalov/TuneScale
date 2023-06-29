//
//  TuneScaleCoreDataApp.swift
//  TuneScaleCoreData
//
//  Created by Kostadin on 20.06.21.
//

import SwiftUI

@main
struct TuneScaleCoreDataApp: App {
    let controller = PersistanceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}
