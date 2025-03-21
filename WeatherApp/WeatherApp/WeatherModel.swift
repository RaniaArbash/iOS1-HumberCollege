//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2025-03-21.
//

import Foundation
// any class to be used with jsonDeconder should implement Codable

class WeatherModel : Codable{
    
    var weather : [WeatherArrayModel] = []
    var main : MainClass = MainClass()
    var wind : WindClass = WindClass()
    var name : String = ""
}

class WeatherArrayModel : Codable{
    var main : String = ""
    var icon : String = ""
}

class MainClass : Codable{
    var temp : Double = 0.0
    var feels_like : Double = 0.0
}

class WindClass : Codable{
    var speed : Double = 0.0
}
