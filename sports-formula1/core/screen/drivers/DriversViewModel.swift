//
//  DriversViewModel.swift
//  sports-formula1
//
//  Created by user on 25.08.2023.
//

import Foundation

class DriversViewModel: ObservableObject {
    
    @Published var models: [DriverModel] = [
        DriverModel(rank: 1,
                    
                    points: 314,
                    name: "Max Verstappen",
                    countryCode: "NL",
                    teamName: "Red Bull Racing",
                    driverNo: 25,
                    imageUrl: "https://media-3.api-sports.io/formula-1/drivers/25.png"),
        
        DriverModel(rank: 2,
                    points: 313,
                    name: "Mercedes Petronas",
                    countryCode: "GB",
                    teamName: "Red Bull Racing",
                    driverNo: 20,
                    imageUrl: "https://media-3.api-sports.io/formula-1/drivers/20.png"),
        
        DriverModel(rank: 3,
                    points: 312,
                    name: "Sergio Perez",
                    countryCode: "IT",
                    teamName: "Red Bull Racing",
                    driverNo: 10,
                    imageUrl: "https://media-3.api-sports.io/formula-1/drivers/10.png")
    ]
}
