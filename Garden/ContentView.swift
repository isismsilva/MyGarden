//
//  ContentView.swift
//  Garden
//
//  Created by Isis Silva on 27/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
  @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Plant.name, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Plant>
  
  let colums = Array.init(repeating: GridItem(.flexible(), spacing: 2), count: 3)
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: colums, spacing: 2) {
          ForEach(Array(items.enumerated()), id: \.offset) { (index, item) in
            NavigationLink {
              Text("Item at index: \(index)")
            } label: {
              PlantItemView(color: Color(.white).indexedColor(index, steps: items.count), name: item.name ?? "")
            }
          }
        }
        
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        ToolbarItem {
          Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
      Text("Select an item")
    }.alert(item: $connectivityManager.notificationMessage) { message in
      Alert(title: Text(message.text),
            dismissButton: .default(Text("Dismiss")))
    }
  }
  
  private func addItem() {
    withAnimation {
      let newItem = Plant(context: viewContext)
      newItem.name = "Bia"
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
