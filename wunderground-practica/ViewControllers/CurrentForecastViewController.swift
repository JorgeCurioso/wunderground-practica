//
//  CurrentForecastViewController.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import UIKit

class CurrentForecastViewController: UIViewController {

    private var weatherService: WeatherService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService = WeatherService()
        weatherService?.fetchCurrentWeather(completion: { (currentWeatherInfo) in
            DispatchQueue.main.async {
                print("currentTemp: \(currentWeatherInfo.temperatureInDegreesFarenheit)º")
                //update UI
            }
        })
    }

}

