//
//  ToDo+CoreDataProperties.swift
//  Week12CoreDate-ToDoApp
//
//  Created by Rania Arbash on 2024-11-22.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var id: Int16
    @NSManaged public var task: String?
    @NSManaged public var isUrgent: Bool
    @NSManaged public var date: Date?

}

extension ToDo : Identifiable {

}
