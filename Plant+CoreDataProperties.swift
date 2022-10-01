//
//  Plant+CoreDataProperties.swift
//  Garden
//
//  Created by Isis Silva on 01/10/22.
//
//

import Foundation
import CoreData


extension Plant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: "Plant")
    }

    @NSManaged public var image: Data?
    @NSManaged public var lightAmount: Int64
    @NSManaged public var name: String?
    @NSManaged public var purchaseDate: Date?
    @NSManaged public var waterAmount: Int64
    @NSManaged public var species: NSSet?

  
  public var specieArray: [Species] {
    let set = species as? Set<Species> ?? []
    
    return set.sorted { $0.name ?? "" < $1.name ?? "" }
  }
}

// MARK: Generated accessors for specie
extension Plant {

    @objc(addSpecieObject:)
    @NSManaged public func addToSpecie(_ value: Species)

    @objc(removeSpecieObject:)
    @NSManaged public func removeFromSpecie(_ value: Species)

    @objc(addSpecie:)
    @NSManaged public func addToSpecie(_ values: NSSet)

    @objc(removeSpecie:)
    @NSManaged public func removeFromSpecie(_ values: NSSet)

}

extension Plant : Identifiable {

}
