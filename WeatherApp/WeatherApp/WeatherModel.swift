//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-11-08.
//

import Foundation

class WeatherModel: Decodable {
    var weather : [weatherObj] = [weatherObj]()
    var main: weatherMain = weatherMain()
    var wind : windObj = windObj()
}

class weatherObj : Decodable{
    var description : String = ""
    var icon = ""
}

class weatherMain :Decodable{
    var temp: Double = 0.0
    var feels_like = 0.0
}

class windObj :Decodable{
    var speed: Double = 0.0
}
