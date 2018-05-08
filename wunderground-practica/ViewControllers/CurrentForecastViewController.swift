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
        
        setupWeatherService()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchCurrentWeatherData { weatherInfo in
            self.updateUIFor(weatherInfo)
        }
    }
    
    internal func updateUIFor(_ currentWeatherInfo: CurrentWeatherInfo) {
        //consider other possibilities for where to dispatch to the main queue
        DispatchQueue.main.async {
            self.currentTemperatureLabel.text = self.formattedTemperatureFrom(currentWeatherInfo.degreesFarenheit)
        }
    }
    
    private func formattedTemperatureFrom(_ temperature: Measurement<UnitTemperature>) -> String {
        let measurementFormatter = MeasurementFormatter()
        return measurementFormatter.string(from: temperature)
    }
}

extension CurrentForecastViewController: CurrentWeatherDataFetchable {
    
    func setupWeatherService() {
        guard weatherService != nil else {
            weatherService = WeatherService()
            return
        }
    }
    
    func fetchCurrentWeatherData(completion: @escaping (CurrentWeatherInfo) -> Void) {
        weatherService?.fetchCurrentWeather(completion: { completion($0) })
    }
    
}

protocol CurrentWeatherDataFetchable {
    
    func setupWeatherService()
    func fetchCurrentWeatherData(completion: @escaping (CurrentWeatherInfo) -> Void)
    
}

