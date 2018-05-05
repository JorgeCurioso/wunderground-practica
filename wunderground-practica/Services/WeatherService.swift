//
//  WeatherService.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct WeatherService {
    
    private let weatherUndergroundKey = ""
    
    /**fetches current weather data based on location and calls completion with current weather data model
     */
    func fetchCurrentWeather() {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.wunderground.com"
        components.path = "/api/\(weatherUndergroundKey)/conditions/q/42.048,-82.038.json"
        
        guard let url = components.url else {
            print("could not create url")
            return
        }
        
        NetworkManager.fetchDataFor(url: url) { (data) in
            print(String(describing: String(data: data, encoding: .utf8)))
        }
    }
    
}
