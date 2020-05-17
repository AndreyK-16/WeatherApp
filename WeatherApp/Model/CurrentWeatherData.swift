//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Андрей К on 10.05.2020.
//  Copyright © 2020 Андрей Кальдяев. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let wind : Wind
    let weather: [Weather]
}

struct Wind: Decodable {
    let speed: Double
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
    
    
}

struct Weather: Decodable {
    let id: Int
}
