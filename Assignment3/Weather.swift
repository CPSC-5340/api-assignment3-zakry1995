//
//  Weather.swift
//  Assignment3
//
//  Created by Ansley Ellen Davis on 3/30/24.
//

import Foundation

struct WeatherResponse: Codable {
    let main: WeatherMain
    let weather: [WeatherDetail]
    let name: String
}

struct WeatherMain: Codable {
    let temp: Double
    let humidity: Int
}

struct WeatherDetail: Codable {
    let main: String
    let description: String
    let icon: String
}
