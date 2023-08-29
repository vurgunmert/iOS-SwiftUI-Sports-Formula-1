//
//  DriverModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation

struct DriverModel: Identifiable, Equatable {
    let id: Int
    let rank: Int
    let points: Int
    let name: String
    let countryCode: String?
    let teamName: String
    let driverNo: Int
    let imageUrl: String
}
