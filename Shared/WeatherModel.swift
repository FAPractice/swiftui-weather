//
//  WeatherModel.swift
//  Weather
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import Foundation

struct WeatherModel: Codable {
//    
//    var id = UUID()
//    
    struct Coordinates: Codable {
        let lon: Double;
        let lat: Double;
    }
//    
//    struct Weather: Codable {
//        let id: Int
//        let main: String
//        let description: String
//        let icon: String
//    }
//    
    struct Temperature: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }
//    
//    struct Wind: Codable {
//        let speed: Double
//        let deg: Double
//    }
//    
//    struct Clouds: Codable {
//        let all: Int
//    }
//    
//    struct Sys: Codable {
//        let country: String
//        let sunrise: Int
//        let sunset: Int
//    }
//    
    let coord: Coordinates
//    let weather: Weather
    let main: Temperature
//    let visibility: Int
//    let wind: Wind
//    let clouds: Clouds
//    let sys: Sys
    let name: String

}
