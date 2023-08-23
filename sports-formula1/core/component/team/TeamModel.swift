//
//  TeamModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation

struct TeamModel: Identifiable {
    let id = UUID()
    let position: Int
    let name: String
    let points: Int
    let imageUrl: String?
    let driver1Name: String?
    let driver2Name: String?

    init(position: Int, name: String, points: Int, imageUrl: String? = nil, driver1Name: String? = nil, driver2Name: String? = nil) {
        self.position = position
        self.name = name
        self.points = points
        self.imageUrl = imageUrl
        self.driver1Name = driver1Name
        self.driver2Name = driver2Name
    }
}
