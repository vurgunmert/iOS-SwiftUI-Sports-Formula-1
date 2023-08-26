//
//  RacesScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct RacesScreenView: View {
    
    @EnvironmentObject var catalog: Catalog
    
    var body: some View {
        
        List {
            ForEach(catalog.races) { model in
                
                RaceSummaryView(model: model)
                    .shadow(radius: 2)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(GroupedListStyle())
        .task {
            do {
                try await catalog.loadRaces()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct RacesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RacesScreenView()
    }
}
