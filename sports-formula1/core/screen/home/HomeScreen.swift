//
//  HomeScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct HomeScreenView: View {
    
    @EnvironmentObject var ranking: Ranking
    @EnvironmentObject var catalog: Catalog
    
    var body: some View {
        
        List {
            
            ForEach(catalog.races, content: { model in
                
                if model.dateTime?.timeIntervalSinceNow ?? 0 > 0 {
                    Text("Next")
                        .font(.system(size: 24, weight: .thin))
                } else {
                    Text("Previous")
                        .font(.system(size: 24, weight: .thin))
                }
                
                RaceSummaryView(model: model)
                    .shadow(radius: 2)
                    .listRowSeparator(.hidden)
            })
            
            Text("Top Teams")
                .font(.system(size: 24, weight: .thin))
                .padding(.top, 30)
            
            ForEach(ranking.teams) { model in
                TeamMiniView(model: model)
            }
            
        }
        .listStyle(GroupedListStyle())
        .task {
            do {
                try await catalog.loadRaces()
                try await ranking.loadTeams()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
