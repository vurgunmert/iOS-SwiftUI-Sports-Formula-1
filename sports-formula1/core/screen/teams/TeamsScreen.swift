//
//  TeamsScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct TeamsScreenView: View {
    
    @EnvironmentObject private var ranking: Ranking

    var body: some View {
        List(ranking.teams) { model in
            TeamView(model: model)
        }
        .listStyle(GroupedListStyle())
        .task {
            do {
                try await ranking.loadTeams()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct TeamsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsScreenView()
    }
}
