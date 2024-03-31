//
//  WeatherViewModel.swift
//  Assignment3
//
//  Created by Ansley Ellen Davis on 3/30/24.
//
import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherResponse: WeatherResponse?

    func fetchWeather(city: String) {
        let apiKey = "e148cd37b4506ce75312357c8a0b58f4" // Directly use the API key
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityEncoded)&appid=\(apiKey)&units=metric") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                do {
                    self?.weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                } catch {
                    print("Failed to decode JSON")
                }
            }
        }.resume()
    }
}
