//
//  Species+CoreDataProperties.swift
//  Garden
//
//  Created by Isis Silva on 01/10/22.
//
//

import Foundation
import CoreData


extension Species {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Species> {
        return NSFetchRequest<Species>(entityName: "Species")
    }

    @NSManaged public var color: String?
    @NSManaged public var name: String?
    @NSManaged public var plant: NSSet?
  
  public var plantArray: [Plant] {
    let set = plant as? Set<Plant> ?? []
    return set.sorted { $0.name ?? "" < $1.name ?? "" } 
  }

}

// MARK: Generated accessors for plant
extension Species {

    @objc(addPlantObject:)
    @NSManaged public func addToPlant(_ value: Plant)

    @objc(removePlantObject:)
    @NSManaged public func removeFromPlant(_ value: Plant)

    @objc(addPlant:)
    @NSManaged public func addToPlant(_ values: NSSet)

    @objc(removePlant:)
    @NSManaged public func removeFromPlant(_ values: NSSet)

}

extension Species : Identifiable {

}
