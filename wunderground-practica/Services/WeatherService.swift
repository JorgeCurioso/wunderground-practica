//
//  WeatherService.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

private struct RawIntermediateCurrentWeatherInfo: Codable {
    
    let current_observation: RawCurrentWeatherInfo
    
}

private struct RawIntermediateTenDayForecastInfo: Codable {
    
    let simpleforecast: RawTenDayForecast
    
}

class WeatherService {
    
    private let weatherUndergroundKey = ""
    
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
                let weatherInfo = try JSONDecoder().decode(RawIntermediateCurrentWeatherInfo.self, from: data)
                let rawCurrentWeatherInfo = weatherInfo.current_observation
                let currentWeatherInfo = CurrentWeatherInfo(rawCurrentWeatherInfo)
                
                completion(currentWeatherInfo)
            } catch {
                print("could not parse data model: \(error)")
            }
        }
    }
    
    func fetchTenDayForecast(completion: @escaping (TenDayForecast) -> Void) {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.wunderground.com"
        components.path = "/api/\(weatherUndergroundKey)/forecast10day/q/42.048,-82.038.json"
        
        guard let url = components.url else {
            print("could not create url")
            return
        }
        
        NetworkManager.fetchDataFor(url: url) { (data) in
            do {
                
                
                completion(TenDayForecast())
            } catch {
                print("could not parse data model: \(error)")
            }
        }
    }
    
}

