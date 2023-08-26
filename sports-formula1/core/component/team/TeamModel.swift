//
//  TeamModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation

struct TeamModel: Identifiable, Equatable {
    let id: Int
    let position: Int
    let name: String
    let points: Int
    let imageUrl: String?

    init(id: Int = 0, position: Int, name: String, points: Int, imageUrl: String? = nil) {
        self.id = id
        self.position = position
        self.name = name
        self.points = points
        self.imageUrl = imageUrl
    }
}
