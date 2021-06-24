//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import SwiftUI

struct ContentView: View {
    private var apiKey: String = "TODO: API KEY HERE"
    @State private var model: WeatherModel?
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    if let model = model {
                        Text(model.name)
                            .font(.headline)
                        Text("\(model.main.temp), feels like \(model.main.feels_like)")
                    }
                }
            }
            .navigationBarItems(leading: Button("Fetch") {
                print("Fetching Data...")
                let url = "https://api.openweathermap.org/data/2.5/weather?q=london&units=metric&appid=\(apiKey)"
                
                guard let url = URL(string: url) else {
                    print("Invalid URL")
                    return
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
            })
            .navigationTitle("Weather")
        }
    }
}
