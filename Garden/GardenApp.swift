//
//  GardenApp.swift
//  Garden
//
//  Created by Isis Silva on 27/09/22.
//

import SwiftUI

@main
struct GardenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainGalleryView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
