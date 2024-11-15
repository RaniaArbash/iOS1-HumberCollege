//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-11-08.
//

import UIKit

class WeatherViewController: UIViewController , NetworkingDelegate{

    @IBOutlet weak var feelsLikeText: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var tempText: UILabel!
    
    @IBOutlet weak var descText: UILabel!
    
    
    @IBOutlet weak var windSpeedText: UILabel!
    var selectedCity: String = ""
    
    var notificationName = (UIApplication.shared.delegate as! AppDelegate).notificationName
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myNotification = Notification.Name(notificationName)

        self.title = selectedCity
        NetworkingManager.shared.delegate = self
        NetworkingManager.shared.getWeather(city: selectedCity)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: myNotification, object: nil)
    }
    

    @objc
    func updateUI(_ notification: Notification){
        
        var wo = notification.userInfo!["weatherObj"] as! WeatherModel
        DispatchQueue.main.async {
            self.descText.text = wo.weather[0].description
            self.tempText.text = "Temp: \(wo.main.temp)"
            self.feelsLikeText.text = "Feels Like: \(wo.main.feels_like)"
            self.windSpeedText.text =  "Wind Speed: \(wo.wind.speed)"
            self.downloadIcon(icon:wo.weather[0].icon)
        }
        
    }
    
    
    func networkingDidFinishWithListOfCities(cities: [String]) {
        
    }
    
    func networkingDidFinishWithWeatherObj(wo: WeatherModel) {
        
        DispatchQueue.main.async {
            
            self.descText.text = wo.weather[0].description
            self.tempText.text = "Temp: \(wo.main.temp)"
            self.feelsLikeText.text = "Feels Like: \(wo.main.feels_like)"
            self.windSpeedText.text =  "Wind Speed: \(wo.wind.speed)"
            self.downloadIcon(icon:wo.weather[0].icon)
            
        }
        
    }
    
    func downloadIcon(icon:String){
            var url = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")!
           
            var myQ = DispatchQueue(label: "myQ")
        myQ.async {
            do{
                var imgData = try  Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    self.weatherIcon.image = UIImage(data: imgData)
                    
                }
                
            }catch {
                print(error)
            }
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
