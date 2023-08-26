//
//  DriversScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct DriversScreenView: View {
    
    @EnvironmentObject var ranking: Ranking
    
    var body: some View {
        
        List(ranking.drivers) { model in
            DriverView(model: model)
        }
        .listStyle(GroupedListStyle())
        .task {
            do {
                try await ranking.loadDrivers()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct DriversScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DriversScreenView()
    }
}
