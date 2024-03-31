//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    let cities = ["London", "Tokyo", "New York", "Sydney"]
    
    var body: some View {
        NavigationView {
            List(cities, id: \.self) { city in
                NavigationLink(destination: WeatherDetailView(city: city, viewModel: viewModel)) {
                    Text(city)
                }
            }
            .navigationBarTitle("Cities")
        }
    }
}

