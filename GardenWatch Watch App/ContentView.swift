//
//  ContentView.swift
//  GardenWatch Watch App
//
//  Created by Isis Silva on 27/09/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
  @Environment(\.managedObjectContext) private var viewContext
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
      
      Button {
        addItem()
        connectivityManager.send("Hello iPhone")
      } label: {
        Text("Tap me")
      }

    }
    .padding()
  }
  
  private func addItem() {
    withAnimation {
      let newItem = Plant(context: viewContext)
      newItem.name = "Ísis"
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
