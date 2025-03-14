//
//  NetworkingManager.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2025-03-14.
//

import Foundation


class NetworkingManager {
    // get all data from cities app
    
    static var shared = NetworkingManager()
    
    func getAllCitiesFromAPI(searchTerm: String){
        
        let url = URL(string: "http://gd.geobytes.com/AutoCompleteCity?&q=\(searchTerm)")!
        
        var task =  URLSession.shared.dataTask(with: url) { data, response, error in
            
            // check if there is error ===> no data
            if let error = error {
                print ("There is a network error")
                return
            }
            
            // check if the response not between 200 and 299 ==> no data
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("There is no good resposne ")
                return
            }
            
        // the data is ready
            if let goodData = data {
                var json = String(data: goodData, encoding: .utf8)
                print (json ?? "no data")
            }
            
        }
        task.resume()
        
        
    }
    
    // get weather data from open weather map
    
}
