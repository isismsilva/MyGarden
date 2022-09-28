//
//  GardenWatchApp.swift
//  GardenWatch Watch App
//
//  Created by Isis Silva on 27/09/22.
//

import SwiftUI

@main
struct MyGardenWatch_Watch_AppApp: App {
  let persistenceController = PersistenceController.shared
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
