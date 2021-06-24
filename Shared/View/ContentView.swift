//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherController: WeatherController = WeatherController()
    
    @State private var model: WeatherModel?

    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(weatherController.weather, id: \.self.name) { weatherItem in
                    Text(weatherItem.name)
                        .font(.headline)
                    Text("\(weatherItem.weather[0].main) · \(weatherItem.main.temp)")
                }
            }
            .toolbar(content: {
                Button("Add") {
                    showingAddSheet = true
                }
            })
            .navigationTitle("Weather")
            .sheet(isPresented: $showingAddSheet) {
                Text("Sup")
            }
        }
    }
    func fetchWeather(city: String, unit: String = "metric") -> WeatherModel? {
        let apiKey: String = Bundle.main.fetchAPIKey()
        var model: WeatherModel?
        
        print("Fetching Data...")
        print("API Key: \(apiKey)")
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(unit)&appid=\(apiKey)"
        
        guard let url = URL(string: url) else {
            fatalError("Invalid URL")
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            if err != nil {
                print("URLSession Error: ", err!)
                return
            }
            print("Response: ", res.debugDescription)
            if let data = data {
                if let decoded = try? JSONDecoder().decode(WeatherModel.self, from: data) {
                    model = decoded
                } else {
                    print("Error Occured Decoding Data")
                }
            } else {
                print("Error Occured Getting Contents of URL")
            }
        }.resume()
        return model
    }
}
