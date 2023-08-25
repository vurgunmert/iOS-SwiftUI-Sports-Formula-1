//
//  TeamsViewModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

class TeamsViewModel: ObservableObject {
    
    private let repository = FormulaRepository()
    
    @Published var models: [TeamModel] = []
    
    init() {
        repository.getTeams(onResponse: { items in
            self.models = items.map( {
                TeamModel(position: $0.position,
                          name: $0.team.name,
                          points: $0.points,
                          imageUrl: $0.team.logo,
                          driver1Name: "Driver 1",
                          driver2Name: "Driver 2")
            })
        })
    }
}
