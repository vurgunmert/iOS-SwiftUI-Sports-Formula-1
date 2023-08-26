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
            Text("Schedule")
                .font(.system(size: 24, weight: .thin))
            
            ForEach(catalog.races, content: { model in
                RaceSummaryView(model: model)
                    .shadow(radius: 2)
                    .listRowSeparator(.hidden)
            })
            
            Text("Top Teams")
                .font(.system(size: 24, weight: .thin))
                .padding(.top, 30)
            
            ForEach(ranking.teams) { model in
                TeamMiniView(model: model)
                    .swipeActions(edge: .trailing, content: {
                        Button(role: .none, action: {
                            print("TODO_TEAM_SWIPE_ACTION")
                        } ) {
                            Label("Details", systemImage: "rectangle.expand.vertical")
                        }
                    })
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
