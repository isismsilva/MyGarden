//
//  Persistence.swift
//  Garden
//
//  Created by Isis Silva on 27/09/22.
//

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()
  
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for _ in 0..<10 {
      let newItem = Plant(context: viewContext)
      newItem.name = "Orquidia"
    }
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
  
  let container: NSPersistentCloudKitContainer
  
  init(inMemory: Bool = false) {
    container = NSPersistentCloudKitContainer(name: "Garden")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
  }
  
  func saveData(_ plant: String, image: Data) {
    container.viewContext.performAndWait {
      let planEntity = Plant(context: container.viewContext)
      planEntity.name = plant
      planEntity.image = image
      
      do {
        try container.viewContext.save()
      } catch {
        print("Unable to save")
      }
    }
  }
  
  func fetchImage() -> Plant {
    var fetchingImage: [Plant]? = []
  let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")
  do {
    container.viewContext.performAndWait {
      fetchingImage = try? container.viewContext.fetch(fetchRequest) as? [Plant]
    }
   
  } catch {
  print("Error while fetching the image")
  }
    return fetchingImage?.first ?? Plant(context: container.viewContext)
  }
}
