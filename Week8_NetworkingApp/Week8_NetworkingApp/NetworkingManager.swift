//
//  NetworkingManager.swift
//  Week8_NetworkingApp
//
//  Created by Rania Arbash on 2024-11-01.
//

import Foundation

protocol NetworkingDelegate {
    func networkingDidFinishWithStudentInfo(stdinfo : StudentInfo)
    func networkingDidFail()
}

class NetworkingManager {
    
     static var shared = NetworkingManager()
    var delegate : NetworkingDelegate?
    
    // get all API data from a url
    func getStdDataFromAPI() {
        // my code run in a different thread - not in main thread
        
        let url = URL(string: "https://raw.githubusercontent.com/RaniaArbash/Networking_IOS/main/courses_data.json")
        
        let datatask = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {// handle, then...return}
                               print(error)
                                self.delegate?.networkingDidFail()
                               return
                       }
            guard let httpResponse =
                               response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)
                       else {
                           // no good response
                            self.delegate?.networkingDidFail()
                           return
                       }
            
            if let goodData = data {
                
                let decoder = JSONDecoder()
                do {
                    let stdFromAPI = try decoder.decode(StudentInfo.self, from: goodData)
                    
                   
                    self.delegate?.networkingDidFinishWithStudentInfo(stdinfo: stdFromAPI)
                }catch {
                    print(error)
                    
                }
            }
        }
    datatask.resume()
        
       
        
    }
    
    
}
