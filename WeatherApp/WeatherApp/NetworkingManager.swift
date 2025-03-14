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

class NetworkingManager {
    // get all data from cities app
    static var shared = NetworkingManager()
    
    var delegate : NetworkingDelegate?
    
    
    func getAllCitiesFromAPI(searchTerm: String){
        
        let url = URL(string: "http://gd.geobytes.com/AutoCompleteCity?&q=\(searchTerm)")!
        
        var task =  URLSession.shared.dataTask(with: url) { data, response, error in
            
            // check if there is error ===> no data
            if error != nil {
                print ("There is a network error")
                self.delegate?.networkingDidFail()
                return
            }
            
            // check if the response not between 200 and 299 ==> no data
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("There is no good resposne ")
                self.delegate?.networkingDidFail()
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
                        self.delegate?.networkingDidFinishWithResult(list: listOfCities)
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
    
}
