//
//  WeatherServiceTests.swift
//  wunderground-practicaTests
//
//  Created by George Royce on 5/7/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

@testable import wunderground_practica
import OHHTTPStubs
import XCTest

class WeatherServiceTests: XCTestCase {
    
    let currentVendorHost = "api.wunderground.com"
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }
    
    //MARK: - Current Weather Info -
    
    func testWeatherServiceParsesSuccessfulCurrentWeatherResponse() {
        
        let successfulRequestExpectation = expectation(description: "successful request")
        let expectedCurrentTemperature: Double = 68.0
        var weatherInfo: CurrentWeatherInfo!

        stub(condition: isHost(currentVendorHost)) { _ in
            let testBundle = Bundle(for: type(of: self))
            let path = testBundle.url(forResource: "successfulCurrentWeatherResponse", withExtension: "json")!.path
            print("successfully returned fixture: \(path)")
            return fixture(filePath: path, status: 200, headers: nil)
        }
        
        let weatherService = WeatherService()
        weatherService.fetchCurrentWeather { (currentWeatherInfo) in
            weatherInfo = currentWeatherInfo
            successfulRequestExpectation.fulfill()
        }

        waitForExpectations(timeout: 10.0, handler: nil)
        XCTAssertEqual(expectedCurrentTemperature, weatherInfo.degreesFarenheit.value)

    }
    
    
}
