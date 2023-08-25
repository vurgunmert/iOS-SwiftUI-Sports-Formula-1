//
//  CircuitsViewModel.swift
//  sports-formula1
//
//  Created by user on 25.08.2023.
//

import Foundation

class CircuitsViewModel: ObservableObject {
    
    @Published var models: [CircuitModel] = [
        CircuitModel(name: "Albert Park Circuit",
                     imageUrl: "https://media-1.api-sports.io/formula-1/circuits/1.png",
                     city: "Melbourne",
                     country: "Australia",
                     firstGrandPrixYear: 1996,
                     lapCount: 58,
                     length: "5.303 Kms",
                     raceLength: "307.574 kms",
                     lapRecord: CircuitModel.LapRecord(time: "1:24.125",
                                                       driverName: "Michael Schumacher",
                                                       year: "2004")),
        
        CircuitModel(name: "Albert Park Circuit",
                     imageUrl: "https://media-1.api-sports.io/formula-1/circuits/1.png",
                     city: "Melbourne",
                     country: "Australia",
                     firstGrandPrixYear: 1996,
                     lapCount: 58,
                     length: "5.303 Kms",
                     raceLength: "307.574 kms",
                     lapRecord: CircuitModel.LapRecord(time: "1:24.125",
                                                       driverName: "Michael Schumacher",
                                                       year: "2004")),
        
        CircuitModel(name: "Albert Park Circuit",
                     imageUrl: "https://media-1.api-sports.io/formula-1/circuits/1.png",
                     city: "Melbourne",
                     country: "Australia",
                     firstGrandPrixYear: 1996,
                     lapCount: 58,
                     length: "5.303 Kms",
                     raceLength: "307.574 kms",
                     lapRecord: CircuitModel.LapRecord(time: "1:24.125",
                                                       driverName: "Michael Schumacher",
                                                       year: "2004")),
        
        CircuitModel(name: "Albert Park Circuit",
                     imageUrl: "https://media-1.api-sports.io/formula-1/circuits/1.png",
                     city: "Melbourne",
                     country: "Australia",
                     firstGrandPrixYear: 1996,
                     lapCount: 58,
                     length: "5.303 Kms",
                     raceLength: "307.574 kms",
                     lapRecord: CircuitModel.LapRecord(time: "1:24.125",
                                                       driverName: "Michael Schumacher",
                                                       year: "2004"))
    ]
}
