//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2025-03-21.
//

import UIKit

class WeatherViewController: UIViewController , WeatherDelegate {
    
    var selectedCity: String?
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var tempText: UILabel!
    @IBOutlet weak var feelsLikeText: UILabel!
  
    
    @IBOutlet weak var mainDesText: UILabel!
    
    
    @IBOutlet weak var windText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.shared.weatherDelegate = self
        if let city = selectedCity {
            cityName.text = city
            NetworkingManager.shared.getWeatherInCity(cityName: city)
            
        }
    }
    
    
    func networkingDidFinishGettingWeatherWithObject(weather: WeatherModel) {
        tempText.text = "\(Int(weather.main.temp))"
        feelsLikeText.text = "\(Int(weather.main.feels_like))"
        windText.text = "\(Int(weather.wind.speed))"
        downloadImage(i: weather.weather[0].icon)
        mainDesText.text = weather.weather[0].main
    }
    
    func downloadImage(i:String){
        var imageUrl = "https://openweathermap.org/img/wn/\(i)@2x.png"
        var urlObj = URL(string: imageUrl)!
        var myq = DispatchQueue(label: "myQ")
        myq.async {
            do {
                var imageData = try Data(contentsOf:urlObj)// in background thread
                DispatchQueue.main.async {
                    self.icon.image = UIImage(data: imageData)// in main thread
                    
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    
    func networkingDidFail() {
        
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


