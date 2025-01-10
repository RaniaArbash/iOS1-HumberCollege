//
//  StudentModel.swift
//  Week4
//
//  Created by Rania Arbash on 2024-09-27.
//

import Foundation

class StudentModel {
    var fullName: String = ""
    var program : String = ""
    var semester : String = ""
    
    init(fullName: String, program: String, semester: String) {
        self.fullName = fullName
        self.program = program
        self.semester = semester
    }
    
    func toString() -> String{
        return "\(fullName) - \(program) - \(semester)"
    }
}
