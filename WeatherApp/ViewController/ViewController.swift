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
    
    let networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert)
        
    }
    
    
    //    MARK: - AlertController
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { textField in
            let city = ""
            textField.placeholder = city
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            print("pressed Search button")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { action in
            print("pressed Cancel button")
        }
        
        ac.addAction(search)
        ac.addAction(cancel)
        self.present(ac, animated: true, completion: nil)
    }
    
    
}

