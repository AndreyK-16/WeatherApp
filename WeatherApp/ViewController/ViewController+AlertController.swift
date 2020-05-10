//
//  ViewController+AlertController.swift
//  WeatherApp
//
//  Created by Андрей К on 10.05.2020.
//  Copyright © 2020 Андрей Кальдяев. All rights reserved.
//

import Foundation

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: "Search sity", message: "Enter the name of the city", preferredStyle: .alert)
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            print("pressed Search button")
        }
        let cancel = UIAlertAction(title: "Action", style: .cancel) { action in
            print("pressed Cancel button")
        }
        
        ac.addAction(search)
        ac.addAction(cancel)
        self.present(ac, animated: true, completion: nil)
    }
}
