//
//  CovidManager.swift
//  Covid19
//
//  Created by Bim on 4/9/20.
//  Copyright © 2020 Jiradet Amornpimonkul. All rights reserved.
//

import Foundation

protocol CovidManagerDelegate {
    func didUpdateData(_ covidManager: CovidManager, covid: CovidModel)
}

struct CovidManager {
    let covidURL = "https://corona.lmao.ninja/v2/all"
    
    var delegate: CovidManagerDelegate?
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(covidURL)"
        
        print(urlString)
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: covidURL) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {

                    if let covid = self.parseJSON(safeData) {
                        print("A")
                        self.delegate?.didUpdateData(self, covid: covid)
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ covidData: Data) -> CovidModel? {
        let decoder = JSONDecoder()
        do {

            let decodedData = try decoder.decode(CovidData.self, from: covidData)
            let new = decodedData.todayCases
            let total = decodedData.cases
            let deaths = decodedData.deaths
            let recovered = decodedData.recovered
            let active = decodedData.active

            let covid = CovidModel(new: new, total: total, deaths: deaths, recovered: recovered, active: active)
            print(covid)
            return covid
            
        } catch {
            print(error)
            return nil
        }
    }
}
