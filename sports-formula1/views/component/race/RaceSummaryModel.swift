//
//  RaceScheduleModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation

struct RaceSummaryModel {
    let name: String
    let country: String
    let circuitName: String
    let dateTime: String
    
    let drivers: [Driver]?
    
    struct Driver {
        let position: Int
        let abbr: String
        let imageUrl: String
        let time: String
    }
}
