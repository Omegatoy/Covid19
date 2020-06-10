//
//  CovidData.swift
//  Covid19
//
//  Created by Bim on 4/9/20.
//  Copyright © 2020 Jiradet Amornpimonkul. All rights reserved.
//

import Foundation

struct CovidData: Codable {
    let todayCases: Int
    let cases: Int
    let deaths: Int
    let recovered: Int
    let active: Int
}
