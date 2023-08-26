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
            Section(header: Text("Race Schedule")) {
                
                ForEach(catalog.races, content: { model in
                    
                    Button(action: {
                        print("TODO_RACE_TAP_ACTION race id: \(model.id)")
                        
                    }, label: {
                        RaceSummaryView(model: model)
                    })
                })
            }
            
            Text("Top Teams")
                .font(.system(size: 24, weight: .thin))
                .padding(.top, 30)
            
            ForEach(ranking.teams) { model in
                TeamMiniView(model: model)
                    .swipeActions(edge: .trailing, content: {
                        Button(role: .none, action: {
                            print("TODO_TEAM_SWIPE_ACTION team id: \(model.id)")
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
