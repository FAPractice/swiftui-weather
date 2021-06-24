//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherController: WeatherController = WeatherController()
    
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
                Button(action :{
                    showingAddSheet = true
                }) {
                    Image(systemName: "plus")
                }
            })
            .navigationTitle("Weather")
            .sheet(isPresented: $showingAddSheet, content: { AddView(controller: weatherController) })
        }
    }
}
