//
//  CarCard.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import Foundation

struct CarCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var image: String
}

var formulaCards: [CarCard] = [
    .init(title: "Red Bull", image: "redbull"),
    .init(title: "Mercedes", image: "mercedes"),
    .init(title: "Aston Martin", image: "astonmartin"),
    .init(title: "Ferrari", image: "ferrari")
]
