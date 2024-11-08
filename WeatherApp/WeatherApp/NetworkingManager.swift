
import Foundation

protocol NetworkingDelegate {
    
    func networkingDidFinishWithListOfCities(cities : [String])
    func networkingDidFinishWithWeatherObj(wo : WeatherModel)
    func networkingDidFail()
    
}



class NetworkingManager {
    
     static var shared = NetworkingManager()
    var delegate : NetworkingDelegate?
    
    // get all API data from a url
    func getCitiesFromAPI(city: String) {
        // my code run in a different thread - not in main thread
        
        let url = URL(string: "http://gd.geobytes.com/AutoCompleteCity?&q=\(city)")
        
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
                    let citiesList = try decoder.decode([String].self, from: goodData)
                
                    self.delegate?.networkingDidFinishWithListOfCities(cities:citiesList)
                }catch {
                    print(error)
                    
                }
            }
        }
    datatask.resume()
        
    }
    
    
    
    
    func getWeather(city: String) {
        // my code run in a different thread - not in main thread
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=071c3ffca10be01d334505630d2c1a9c&units=metric")
        
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
                    let weatherObj = try decoder.decode(WeatherModel.self, from: goodData)
                    self.delegate?.networkingDidFinishWithWeatherObj(wo: weatherObj)
                
                    
                }catch {
                    print(error)
                    
                }
            }
        }
    datatask.resume()
        
    }
    
    
}

