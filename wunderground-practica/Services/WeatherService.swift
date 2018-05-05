//
//  WeatherService.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

/** intermediate struct for current weather forecast responses
 */
private struct WeatherInfo: Codable {
    
    let current_observation: RawCurrentWeatherInfo
    
}

struct WeatherService {
    
    private let weatherUndergroundKey = "56d1cbbbdb73f830"
    
    /**fetches current weather data based on location and calls completion with current weather info data model
     */
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherInfo) -> Void) {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.wunderground.com"
        components.path = "/api/\(weatherUndergroundKey)/conditions/q/42.048,-82.038.json"
        
        guard let url = components.url else {
            print("could not create url")
            return
        }
        
        NetworkManager.fetchDataFor(url: url) { (data) in
            do {
                let weatherInfo = try JSONDecoder().decode(WeatherInfo.self, from: data)
                let rawCurrentWeatherInfo = weatherInfo.current_observation
                let currentWeatherInfo = CurrentWeatherInfo(rawCurrentWeatherInfo)
                
                completion(currentWeatherInfo)
            } catch {
                print("could not parse data model")
            }
        }
    }
    
}
