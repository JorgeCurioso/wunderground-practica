//
//  CurrentWeatherInfo.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct CurrentWeatherInfo {
    
    let degreesFarenheit: Measurement<UnitTemperature>
    
    init(_ raw: RawCurrentWeatherInfo) {
        degreesFarenheit = Measurement(value: raw.roundedDegreesFarenheit(), unit: UnitTemperature.fahrenheit)
    }
}

struct RawCurrentWeatherInfo: Codable {
    
    private(set) var temp_f: Float
    
    func roundedDegreesFarenheit() -> Double {
        return Double(temp_f).rounded()
    }
    
    init(degreesFarenheit: Float) {
        temp_f = degreesFarenheit
    }
    
}

