//
//  Car+CoreDataProperties.swift
//  CarOwerApp
//
//  Created by Rania Arbash on 2024-11-29.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var id: Int16
    @NSManaged public var model: String?
    @NSManaged public var year: Int32
    @NSManaged public var ownedBy: Owner?

}

extension Car : Identifiable {

}
