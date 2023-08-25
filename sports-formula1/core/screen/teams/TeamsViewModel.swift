//
//  TeamsViewModel.swift
//  sports-formula1
//
//  Created by user on 25.08.2023.
//

import Foundation

class TeamsViewModel: ObservableObject {
    
    @Published var models: [TeamModel] = [
    
        TeamModel(position: 1,
                  name: "Red Bull Racing",
                  points: 503,
                  imageUrl: "https://media.api-sports.io/formula-1/teams/1.png",
                  driver1Name: "Max Verstappen",
                  driver2Name: "Sergio Perez"),
        
        TeamModel(position: 1,
                  name: "Red Bull Racing",
                  points: 503,
                  imageUrl: "https://media.api-sports.io/formula-1/teams/1.png",
                  driver1Name: "Max Verstappen",
                  driver2Name: "Sergio Perez"),
        
        TeamModel(position: 1,
                  name: "Red Bull Racing",
                  points: 503,
                  imageUrl: "https://media.api-sports.io/formula-1/teams/1.png",
                  driver1Name: "Max Verstappen",
                  driver2Name: "Sergio Perez"),
        
        TeamModel(position: 1,
                  name: "Red Bull Racing",
                  points: 503,
                  imageUrl: "https://media.api-sports.io/formula-1/teams/1.png",
                  driver1Name: "Max Verstappen",
                  driver2Name: "Sergio Perez")
    
    ]
}
