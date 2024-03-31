//
//  WeatherDetailView.swift
//  Assignment3
//
//  Created by Ansley Ellen Davis on 3/30/24.
//

import SwiftUI

struct WeatherDetailView: View {
    let city: String
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            if let weather = viewModel.weatherResponse {
                Text(weather.name)
                    .font(.largeTitle)
                Text("\(weather.main.temp, specifier: "%.1f")°C")
                    .font(.title)
                Text(weather.weather.first?.description ?? "")
                    .font(.body)
            }
        }
        .onAppear {
            viewModel.fetchWeather(city: city)
        }
    }
}

