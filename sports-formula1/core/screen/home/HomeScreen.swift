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

        NavigationView {
            
            List {
                Section(header: Text("Race Schedule")) {
                    
                    ForEach(catalog.races, content: { model in
                        
                        NavigationLink {
                            RaceDetailScreen()
                        } label: {
                            RaceSummaryView(model: model)
                        }
                    })
                }
                
                Text("Top Teams")
                    .font(.system(size: 24, weight: .thin))
                    .padding(.top, 30)
                
                ForEach(ranking.teams) { model in
                    
                    NavigationLink(destination: TeamDetailScreen()) {
                        TeamMiniView(model: model)
                    }
                    .swipeActions(edge: .leading) { Button("Swipe") {print("swipe")} } // winds up disabled by edit mode
                    
                    
                    
                    
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
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

