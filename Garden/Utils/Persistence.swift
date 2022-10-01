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
    container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
  }
  
  func initSpeciesEntity() {
    var species: [Species] = []
    
    container.viewContext.performAndWait {
      do {
        species = try container.viewContext.fetch(Species.fetchRequest())
      } catch {
        print(error)
      }
    }

    guard species.isEmpty else { return }
    for (specie, color) in speciesColors {
      PersistenceController.shared.saveSpeciesData(specie, color: color)
    }
  }
  
  func savePlantData(_ name: String, _ image: Data, _ waterRate: Int, _ lightRate: Int, _ species: Species) {
    container.viewContext.performAndWait {
      
      let speciesEntity = Species(context: container.viewContext)
      speciesEntity.name = species.name
      speciesEntity.color = species.color
      
      let planEntity = Plant(context: container.viewContext)
      planEntity.name = name
      planEntity.image = image
      planEntity.waterAmount = Int64(waterRate)
      planEntity.lightAmount = Int64(lightRate)
      speciesEntity.addToPlant(planEntity)
      
      do {
        try container.viewContext.save()
      } catch {
        print("Unable to save")
      }
    }
  }
  
  func saveSpeciesData(_ name: String, color: String) {
    container.viewContext.performAndWait {
      
      let speciesEntity = Species(context: container.viewContext)
      speciesEntity.name = name
      speciesEntity.color = color
      
      do {
        try container.viewContext.save()
      } catch {
        print("Unable to save")
      }
    }
  }
}
