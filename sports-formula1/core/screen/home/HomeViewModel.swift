//
//  HomeViewModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    private let repository = FormulaRepository()
 
    @Published var raceSummaries: [RaceSummaryModel] = [
    
        RaceSummaryModel(name:  "Netherlands Grand Prix",
                         country: "Netherlands",
                         circuitName: "Circuit Zandvoort",
                         dateTime: dateFrom(date: "2023-08-27T13:00:00+00:00"),
                         drivers: nil),
        
        RaceSummaryModel(name:  "Belgium Grand Prix",
                         country: "Belgium",
                         circuitName: "Circuit de Spa-Francorchamps",
                         dateTime: dateFrom(date: "2023-07-30T13:00:00+00:00"),
                         drivers: [
                            RaceSummaryModel.Driver(position: 1,
                                                    abbr: "VER",
                                                    imageUrl:  "https://media-2.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:22:30.450"),
                            
                            RaceSummaryModel.Driver(position: 2,
                                                    abbr: "VER",
                                                    imageUrl:  "https://media-2.api-sports.io/formula-1/drivers/10.png",
                                                    time: "+22.305s"),
                            
                            RaceSummaryModel.Driver(position: 3,
                                                    abbr: "LEC",
                                                    imageUrl:  "https://media-2.api-sports.io/formula-1/drivers/34.png",
                                                    time: "+32.259s"),
                         ])
        
    ]
    
    @Published var teams: [TeamModel] = [
        TeamModel(position: 1,
                  name: "Red Bull Racing",
                  points: 503),
        
        TeamModel(position: 2,
                  name: "Mercedes-AMG Petronas",
                  points: 247),
        
        TeamModel(position: 3,
                  name: "Aston Martin F1 Team",
                  points: 196)
    ]
    
    init() {
     
    }
}
