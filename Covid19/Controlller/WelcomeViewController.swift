//
//  WelcomeViewController.swift
//  Covid19
//
//  Created by Bim on 4/9/20.
//  Copyright © 2020 Jiradet Amornpimonkul. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var searchTextfield: UITextField!
    
    var covidManager = CovidManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "searchSegue" {
//            let destinationVC = segue.description as! CovidViewController
//            destinationVC
//        }
//    }


}

extension WelcomeViewController: UITextFieldDelegate {
    
    @IBAction func searchButton(_ sender: UIButton) {
        covidManager.fetchWeather(cityName: "a")
    }
    
}
