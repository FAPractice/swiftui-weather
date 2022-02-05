//
//  WeatherModel.swift
//  Weather
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import Foundation


//  "dt": 1560350645,
//  "sys": {
//    "type": 1,
//    "id": 5122,
//    "message": 0.0139,
//    "country": "US",
//    "sunrise": 1560343627,
//    "sunset": 1560396563
//  },
//  "timezone": -25200,
//  "id": 420006353,
//  "name": "Mountain View",
//  "cod": 200

struct Weather: Decodable {
    var coord: WeatherCoordinates
    var weather: WeatherDetails
    var base: String
    var main: WeatherMain
    var visibility: Double
    var wind: WeatherWind
    var name: String
    
    struct WeatherCoordinates: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherDetails: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }
    
    struct WeatherMain: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WeatherWind: Decodable {
        var speed: Double
        var deg: Double
    }
}
