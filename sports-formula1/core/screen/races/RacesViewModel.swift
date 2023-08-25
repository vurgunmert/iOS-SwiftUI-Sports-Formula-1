//
//  RacesViewModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

class RacesViewModel: ObservableObject {
    
    private let repository = FormulaRepository()
    
    @Published var models: [RaceSummaryModel] = []
    
    init() {
        repository.getRaces(onResponse: { items in
            
            self.models =  items.map( {
                
                RaceSummaryModel(name: $0.competition?.name ?? "Unknown",
                                 country: $0.competition?.location?.country ?? "Unknown",
                                 circuitName:  $0.circuit?.name ?? "Unknown",
                                 dateTime: $0.date != nil ? dateFrom(date: $0.date!) : nil,
                                 drivers: [])
                
            })
        })
    }
}
