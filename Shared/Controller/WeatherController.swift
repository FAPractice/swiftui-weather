//
//  WeatherController.swift
//  Weather
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import Foundation

class WeatherController: ObservableObject {
    @Published var weather = [Weather]()
    
    func fetchWeather(q: String) async {
        let q = q.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let urlString =  "api.openweathermap.org/data/2.5/weather?q=\(q)&appid=\(Bundle.main.fetchAPIKey())"
        
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        
        var data = await URLSession.shared.dataTask(with: URLRequest(url: url))
    }
}
