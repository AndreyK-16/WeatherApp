//
//  ViewController.swift
//  WeatherApp
//
//  Created by Андрей К on 09.05.2020.
//  Copyright © 2020 Андрей Кальдяев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterface(weather: currentWeather)
            print(currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
         
    }
    
    
    

    
    
    //    MARK: - AlertController
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { textField in
            let cities = ["San Francisco", "Moscow", "New York", "Tokio"]
            textField.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        
        ac.addAction(search)
        ac.addAction(cancel)
        self.present(ac, animated: true, completion: nil)
    }
    
    func updateInterface(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.humidityLabel.text = "Humidity " + weather.humidityString + "%"
            self.windLabel.text = "Wind " + weather.windSpeedString + "m/s"
            self.weatherImage.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

