//
//  StudentManager.swift
//  Week3
//
//  Created by Rania Arbash on 2025-01-24.
//

import Foundation

class StudentManeger {
    
    var allStudents : [Student] = [
        Student(id: 1, name: "John", age: 22),
        Student(id: 2, name: "Mary", age: 23)
    ]
    
    
    // add new student, remove, update, search
    
    func addNewStudent (id: Int, n: String, a: Int){// add to db, local file, cloud db, API
        allStudents.append(Student(id: id, name: n, age:a))
    }
    
    func deleteOneStudent(todeleteID: Int){
        var indextodelete = -1
        
        
        allStudents.removeAll { s in
            s.id == todeleteID
        }
        
       
        
    }
    
    
    
    
}
