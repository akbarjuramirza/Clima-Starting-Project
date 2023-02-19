//
//  ViewController.swift
//  Clima
//


import UIKit
import CoreLocation
import Alamofire

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var changeCityTextField: UITextField!
    
    //MARK: constants
    let WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "4fe76d6d3ca3d145536320183e9e51a0#"
    
    //MARK: INSTANCES
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    //MARK: Location Manager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            let latitude = String(location.coordinate.latitude)
            let longtitude = String(location.coordinate.longitude)
            
            let parameters : [String : String] = [
                "lat" : latitude,
                "lon" : longtitude,
                "appid" : APP_ID
            ]
            
            getWeatherData(url: WEATHER_URL, parameters: parameters)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    //MARK: NETWORKING
    
    func getWeatherData(url: String, parameters: [String : String]) {
        
    }

}

