//
//  DriversViewModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

class DriversViewModel: ObservableObject {
    
    private let repository = FormulaRepository()
    
    @Published var models: [DriverModel] = []
    
    init() {

        //TODO: threading
        repository.getDrivers(onResponse: { items in

            self.models = items.map({
                DriverModel(rank: $0.position,
                            points: $0.points,
                            name: $0.driver.name,
                            countryCode: "nan", //TODO: Update
                            teamName: $0.team.name,
                            driverNo: $0.driver.number,
                            imageUrl: $0.driver.image)
            })
        })
    }
}
