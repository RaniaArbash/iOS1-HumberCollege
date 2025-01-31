//
//  ModelClasses.swift
//  Week4
//
//  Created by Rania Arbash on 2025-01-31.
//

import Foundation

class Student {
    
    var id = UUID()
    var name : String
    var college: String
    var yearOfBirth : Int
    
    init(id: UUID = UUID(), name: String, college: String, yearOfBirth: Int) {
        self.id = id
        self.name = name
        self.college = college
        self.yearOfBirth = yearOfBirth
    }
}


class ProgrammingClassManager {
    // MVC
    var listOfStudnets = [
    Student(name: "John Lee", college: "Humber College", yearOfBirth: 2000),
    Student(name: "Mary Smith", college: "Seneca College", yearOfBirth: 2001),
    Student(name: "George Dao", college: "Centennial College", yearOfBirth: 1998),
    ]
    
    func addNewStudent (newStd: Student) {
        listOfStudnets.append(newStd)
    }
    
    // edit
    // delete
    
    func editStudent(toeditStd: Student){
        
        
    }
    
    func deleteOneStudent(toDelete: Student){
        
        
    }
    
    
}




