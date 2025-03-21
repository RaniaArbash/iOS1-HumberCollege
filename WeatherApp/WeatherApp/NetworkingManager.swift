//
//  NetworkingManager.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2025-03-14.
//

import Foundation

protocol NetworkingDelegate {
    func networkingDidFinishWithResult ( list: [String])
    func networkingDidFail()
}

protocol WeatherDelegate {
    func networkingDidFinishGettingWeatherWithObject ( weather: WeatherModel)
    func networkingDidFail()
}


class NetworkingManager {
    // get all data from cities app
    static var shared = NetworkingManager()
    
    var networkingDelegate : NetworkingDelegate?
    var weatherDelegate : WeatherDelegate?

    
    func getAllCitiesFromAPI(searchTerm: String){
        
        let url = URL(string: "http://gd.geobytes.com/AutoCompleteCity?&q=\(searchTerm)")!
        
        var task =  URLSession.shared.dataTask(with: url) { data, response, error in
            
            // check if there is error ===> no data
            if error != nil {
                print ("There is a network error")
                self.networkingDelegate?.networkingDidFail()
                return
            }
            
            // check if the response not between 200 and 299 ==> no data
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("There is no good resposne ")
                self.networkingDelegate?.networkingDidFail()
                return
            }
            
        // the data is ready
            if let goodData = data {
                var decoder = JSONDecoder()
                do {
                   var listOfCities = try decoder.decode([String].self, from: goodData)
                    // I need to send this object to main thread and to view controller to update UI
                    // Option 1 - Create a delegate protocole for this class.
                    DispatchQueue.main.async {
                        self.networkingDelegate?.networkingDidFinishWithResult(list: listOfCities)
                    }
                    
                }catch {
                    print (error)
                }
               // var json = String(data: goodData, encoding: .utf8)
                //print (json ?? "no data")
            }
        
        }
        task.resume()
        
    }
    
    // get weather data from open weather map
 
    // name,state,country
    func getWeatherInCity(cityName: String){
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=071c3ffca10be01d334505630d2c1a9c&units=metric")!
        
        var task =  URLSession.shared.dataTask(with: url) { data, response, error in
            
            // check if there is error ===> no data
            if error != nil {
                print ("There is a network error")
                self.weatherDelegate?.networkingDidFail()
                return
            }
            
            // check if the response not between 200 and 299 ==> no data
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("There is no good resposne ")
                self.weatherDelegate?.networkingDidFail()
                return
            }
            
        // the data is ready
            if let goodData = data {
                do{
                    var dic = try JSONSerialization.jsonObject(with: goodData) as! NSDictionary
                    var weatherArray = dic.object(forKey: "weather") as! NSArray
                    
                   var mainString = (weatherArray[0] as! NSDictionary).object(forKey: "main") as! String
                   var icon = (weatherArray[0] as! NSDictionary).object(forKey: "icon") as! String
                    
                    
                }catch{
                    
                }
                
                var decoder = JSONDecoder()
                do {
                   var weatherObject = try decoder.decode(WeatherModel.self, from: goodData)
                    
                    DispatchQueue.main.async {
                        
                        self.weatherDelegate?.networkingDidFinishGettingWeatherWithObject(weather: weatherObject)
                        
                    }
                    
                }catch {
                    print (error)
                }
               // var json = String(data: goodData, encoding: .utf8)
                //print (json ?? "no data")
            }
        
        }
        task.resume()
        
    }
 
    
}
