//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Ayaulym Alzhan on 6/11/17.
//  Copyright © 2017 Ayaulym Alzhan. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    let forecastAPIKey = "d24693fd50caa6fa40c9979f6b516dc8"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
                if let currentWeather = currentWeather {
                    DispatchQueue.main.async {
                        if let temperature = currentWeather.temperature {
                            self.temperatureLabel.text = "\(temperature)°"
                        } else {
                            self.temperatureLabel.text = "-"
                        }
                    }
                }
        }

    }


}















