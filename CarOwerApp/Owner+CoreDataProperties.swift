//
//  Owner+CoreDataProperties.swift
//  CarOwerApp
//
//  Created by Rania Arbash on 2024-11-29.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var yob: Int32
    @NSManaged public var ownes: NSSet?

}

// MARK: Generated accessors for ownes
extension Owner {

    @objc(addOwnesObject:)
    @NSManaged public func addToOwnes(_ value: Car)

    @objc(removeOwnesObject:)
    @NSManaged public func removeFromOwnes(_ value: Car)

    @objc(addOwnes:)
    @NSManaged public func addToOwnes(_ values: NSSet)

    @objc(removeOwnes:)
    @NSManaged public func removeFromOwnes(_ values: NSSet)

}

extension Owner : Identifiable {

}
