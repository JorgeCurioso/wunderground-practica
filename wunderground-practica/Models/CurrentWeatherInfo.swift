//
//  CurrentWeatherInfo.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct CurrentWeatherInfo {
    
    let temperatureInDegreesFarenheit: Float
    let roundedTemperatureInDegreesFarenheit: Int
    
    init(_ raw: RawCurrentWeatherInfo) {
        temperatureInDegreesFarenheit = raw.temp_f
        roundedTemperatureInDegreesFarenheit = Int(temperatureInDegreesFarenheit.rounded())
    }
}

struct RawCurrentWeatherInfo: Codable {
    
    let temp_f: Float
    
}

