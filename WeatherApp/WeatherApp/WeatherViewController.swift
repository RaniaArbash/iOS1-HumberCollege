//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-11-08.
//

import UIKit

class WeatherViewController: UIViewController , NetworkingDelegate{

    

    var selectedCity: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedCity
        NetworkingManager.shared.delegate = self
        NetworkingManager.shared.getWeather(city: selectedCity)
    }
    

    
    func networkingDidFinishWithListOfCities(cities: [String]) {
        
    }
    
    func networkingDidFinishWithWeatherObj(wo: WeatherModel) {
        
        DispatchQueue.main.async {
            print( wo.main.temp)
            print( wo.main.feels_like)
            print( wo.weather[0].description)
            print(wo.wind.speed)
            
            
        }
        
    }
    
    func networkingDidFail() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
