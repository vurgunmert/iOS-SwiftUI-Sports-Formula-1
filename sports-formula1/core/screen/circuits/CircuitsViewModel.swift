//
//  CircuitsViewModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

class CircuitsViewModel: ObservableObject {
    
    private let repository = FormulaRepository()
    
    @Published var models: [CircuitModel] = []
    
    init() {
        
        repository.getCircuits(onResponse: { items in
            
            self.models = items.map {
                CircuitModel(name: $0.name ?? "Unknown",
                             imageUrl:$0.image ?? "https://media-1.api-sports.io/formula-1/circuits/1.png",
                             city: $0.competition?.location?.city ?? "Unknown",
                             country: $0.competition?.location?.country ?? "Unknown",
                             firstGrandPrixYear: $0.firstGrandPrix ?? 0,
                             lapCount: $0.laps ?? 0,
                             length: $0.length ?? "Unknown",
                             raceLength: $0.raceDistance ?? "Unknown",
                             lapRecord: CircuitModel.LapRecord(time: $0.lapRecord?.time ?? "Unknown",
                                                               driverName: $0.lapRecord?.driver ?? "Unknown",
                                                               year: $0.lapRecord?.year ?? "Unknown"))
                
            }
        })
    }
}
