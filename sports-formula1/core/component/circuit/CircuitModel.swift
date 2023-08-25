//
//  CircuitModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation

struct CircuitModel: Identifiable {
    let id = UUID()
    let name: String
    let imageUrl: String
    let city: String
    let country: String
    let firstGrandPrixYear: Int
    let lapCount: Int
    let length: String
    let raceLength: String
    let lapRecord: LapRecord
    
    struct LapRecord {
        let time: String
        let driverName: String
        let year: String
    }
}
