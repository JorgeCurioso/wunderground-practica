//
//  CurrentWeatherInfoTests.swift
//  wunderground-practicaTests
//
//  Created by George Royce on 5/7/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

@testable import wunderground_practica
import XCTest

class CurrentWeatherInfoTests: XCTestCase {
    
    func testTemperatureIsSetFromRawTemperature() {
        //Given
        let expectedTemperature: Double = 60.0
        let floatTemperature: Float = 60.0
        let rawCurrentWeatherInfo = RawCurrentWeatherInfo(degreesFarenheit: floatTemperature)
        
        //When
        let currentWeatherInfo = CurrentWeatherInfo(rawCurrentWeatherInfo)
        
        //Then
        XCTAssertEqual(currentWeatherInfo.degreesFarenheit.value, expectedTemperature)
    }
    
    //testWhen____Then____
    func testRoundedTemperatureRoundsDownCorrectly() {
        //Given
        let expectedTemperature: Double = 60.0
        let floatTemperature: Float = 60.49
        let rawCurrentWeatherInfo = RawCurrentWeatherInfo(degreesFarenheit: floatTemperature)
        
        //When
        let currentWeatherInfo = CurrentWeatherInfo(rawCurrentWeatherInfo)
        
        //Then
        XCTAssertEqual(currentWeatherInfo.degreesFarenheit.value, expectedTemperature)
    }
    
    //testWhen____Then____
    func testRoundedTemperatureRoundsUpCorrectly() {
        //Given
        let expectedTemperature: Double = 61.0
        let floatTemperature: Float = 60.50
        let rawCurrentWeatherInfo = RawCurrentWeatherInfo(degreesFarenheit: floatTemperature)
        
        //When
        let currentWeatherInfo = CurrentWeatherInfo(rawCurrentWeatherInfo)
        
        //Then
        XCTAssertEqual(currentWeatherInfo.degreesFarenheit.value, expectedTemperature)
    }
    
}
