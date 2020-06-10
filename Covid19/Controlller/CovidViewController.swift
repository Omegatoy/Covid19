//
//  CovidViewController.swift
//  Covid19
//
//  Created by Bim on 4/9/20.
//  Copyright © 2020 Jiradet Amornpimonkul. All rights reserved.
//

import UIKit

class CovidViewController: UIViewController{
    
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    var covidManager = CovidManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        covidManager.delegate = self
        covidManager.fetchWeather(cityName: "a")
    
    }

}

extension CovidViewController: CovidManagerDelegate {
    
    func didUpdateData(_ covidManager: CovidManager, covid: CovidModel) {
        DispatchQueue.main.async {
            self.activeLabel.text = String(covid.active)
            self.newLabel.text = String(covid.new)
            self.totalLabel.text = String(covid.total)
            self.deathLabel.text = String(covid.deaths)
            self.recoveredLabel.text = String(covid.recovered)
            // print(self.activeLabel.text)
            
        }
    }
    
}
