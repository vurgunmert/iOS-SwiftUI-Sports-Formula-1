//
//  RacesViewModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

class RacesViewModel: ObservableObject {
    
    @Published var models: [RaceSummaryModel] = [
    
        RaceSummaryModel(name: "Belgium Grand Prix",
                         country: "Belgium",
                         circuitName: "Circuit de Spa-Francorchamps",
                         dateTime: dateFrom(date: "2023-07-30T13:00:00+00:00"),
                         drivers: [
                            RaceSummaryModel.Driver(position: 1,
                                                    abbr: "VER",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940"),
                            RaceSummaryModel.Driver(position: 2,
                                                    abbr: "PER",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940"),
                            RaceSummaryModel.Driver(position: 3,
                                                    abbr: "ALO",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940")
                            
                         ]),
        
        RaceSummaryModel(name: "Belgium Grand Prix",
                         country: "Belgium",
                         circuitName: "Circuit de Spa-Francorchamps",
                         dateTime: dateFrom(date: "2023-07-30T13:00:00+00:00"),
                         drivers: [
                            RaceSummaryModel.Driver(position: 1,
                                                    abbr: "VER",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940"),
                            RaceSummaryModel.Driver(position: 2,
                                                    abbr: "PER",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940"),
                            RaceSummaryModel.Driver(position: 3,
                                                    abbr: "ALO",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940")
                            
                         ]),
        
        
        RaceSummaryModel(name: "Belgium Grand Prix",
                         country: "Belgium",
                         circuitName: "Circuit de Spa-Francorchamps",
                         dateTime: dateFrom(date: "2023-07-30T13:00:00+00:00"),
                         drivers: [
                            RaceSummaryModel.Driver(position: 1,
                                                    abbr: "VER",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940"),
                            RaceSummaryModel.Driver(position: 2,
                                                    abbr: "PER",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940"),
                            RaceSummaryModel.Driver(position: 3,
                                                    abbr: "ALO",
                                                    imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                    time: "1:27:57.940")
                            
                         ])
    
    ]
    
}
