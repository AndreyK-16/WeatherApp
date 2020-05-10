//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Андрей К on 10.05.2020.
//  Copyright © 2020 Андрей Кальдяев. All rights reserved.
//

import Foundation

struct CurrentWeatherData {
    let name: String
    let main: Main
    let wind : Wind
    let weather: Weather
}

struct Wind {
    let speed: Double
}

struct Main {
    let temp: Double
    let humidity: Int
}

struct Weather {
    let id: Int
}
