//
//  WeatherController.swift
//  Weather
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import Foundation

enum WeatherError: Error {
    case CityNotFound
}

class WeatherController: ObservableObject {
    @Published var weather: [WeatherModel] = [WeatherModel]()
    
    func addCity(_ city: String) {
        if let weatherModel = fetchWeather(city: city) {
            print("Adding Item: ", weatherModel)
            weather.append(weatherModel)
            print("New List: ", weather)
        } else {
            print("Unpacking Failed")
        }
        print(weather)
    }
    
    private func fetchWeather(city: String, unit: String = "metric") -> WeatherModel? {
        print("-------------fetchWeather(\(city), \(unit))-------------\n")
        
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
            DispatchQueue.main.async {
                if err != nil {
                    print("URLSession Error: ", err!)
                    return
                }
                print("Response: ", res.debugDescription)
                if let data = data {
                    if let decoded = try? JSONDecoder().decode(WeatherModel.self, from: data) {
                        print("Decoded: ", decoded)
                        model = decoded
                    }
                } else {
                    print("Error Occured Getting Contents of URL")
                }

            }
        }.resume()
        print("Returning Model with Value: ", model)
        print("\n------------------------return------------------------")
        return model
        
    }
    
    init() {
        addCity("London")
        addCity("Paris")
        addCity("Berlin")
        addCity("Tokyo")
    }
}
