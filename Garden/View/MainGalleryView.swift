//
//  MainGalleryView.swift
//  Garden
//
//  Created by Isis Silva on 27/09/22.
//

import SwiftUI
import CoreData

struct MainGalleryView: View {
  @State private var presentAddView = false
  @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: []) private var plants: FetchedResults<Plant>
  let colums = Array.init(repeating: GridItem(.flexible(), spacing: 2), count: 3)
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        LazyVGrid(columns: colums, spacing: 2) {
          ForEach(Array(plants.enumerated()), id: \.offset) { (index, item) in
            let color = Color(.white)
            NavigationLink {
              PlantDetailsView(plant: item, color: color)
            } label: {
              PlantItemView(color: color, name: item.name ?? "", image: item.image ?? Data()).padding(2)
            }
          }
        }
      }
      .navigationTitle("Gallery")
      .fullScreenCover(isPresented: $presentAddView) { AddPlantView() }
      .toolbar {
        ToolbarItem {
          Button(action: { presentAddView.toggle() }) {
            Image(systemName: "plus")
              .foregroundColor(.primary)
              .frame(width: 28, height: 28)
          }
        }
      }
    }
    .alert(item: $connectivityManager.notificationMessage) { message in
      Alert(title: Text(message.text),
            dismissButton: .default(Text("Dismiss")))
    }
    .onAppear {
      PersistenceController.shared.initSpeciesEntity()
    }
  }
  
//  private func deleteItems(offsets: IndexSet) {
//    withAnimation {
//      offsets.map { items[$0] }.forEach(viewContext.delete)
//
//      do {
//        try viewContext.save()
//      } catch {
//        let nsError = error as NSError
//        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//      }
//    }
//  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainGalleryView()
      .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    
    MainGalleryView()
      .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
      .preferredColorScheme(.dark)
  }
}
