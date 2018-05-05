//
//  CurrentForecastViewController.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import UIKit

class CurrentForecastViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    private var weatherService: WeatherService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService = WeatherService()
        weatherService?.fetchCurrentWeather(completion: { (currentWeatherInfo) in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.currentTemperatureLabel.text = "\(currentWeatherInfo.roundedTemperatureInDegreesFarenheit)º"
            }
        })
    }

}

