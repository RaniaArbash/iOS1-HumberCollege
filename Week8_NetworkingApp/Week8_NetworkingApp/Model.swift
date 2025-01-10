//
//  Model.swift
//  Week8_NetworkingApp
//
//  Created by Rania Arbash on 2024-11-01.
//

import Foundation

class StudentInfo : Decodable{
    
    var student: String
    var version : String
    var count : Int
    var data: [Course]
    
    init(student: String, version: String, count: Int, data: [Course]) {
        self.student = student
        self.version = version
        self.count = count
        self.data = data
    }
    init(){
        self.student = ""
        self.version = ""
        self.count = 0
        self.data = [Course]()
    }
    
}

class Course: Decodable {
    
    var id: Int
    var courseCode: String
    var courseName: String
    var image: String
    
    init(id: Int, courseCode: String, courseName: String, image: String) {
        self.id = id
        self.courseCode = courseCode
        self.courseName = courseName
        self.image = image
    }
}
