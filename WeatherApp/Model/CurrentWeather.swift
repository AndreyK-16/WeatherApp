//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Андрей К on 10.05.2020.
//  Copyright © 2020 Андрей Кальдяев. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let windSpeed: Double
    var windSpeedString: String {
        return String(format: "%.1f", windSpeed)
    }
    
    let humidity: Int
    var humidityString: String {
        return String(format: "%.0f", humidity)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 520: return "cloud.sun.rain.fill"
        case 522: return "cloud.heavyrain.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 781: return "tornado"
        case 741: return "cloud.fog.fill"
        case 701...771: return "smoke.fill"
        case 800: return "sun.max.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        windSpeed = currentWeatherData.wind.speed
        humidity = currentWeatherData.main.humidity
        conditionCode = currentWeatherData.weather.first!.id
    }
    
    
}
