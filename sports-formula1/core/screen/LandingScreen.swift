//
//  LandingScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct LandingScreenView: View {
    var body: some View {
        TabView {
            NewsScreen()
                .tabItem {
                    Label("News", systemImage: "house")
                        .tint(.red)
                }
            StandingsScreen()
                .background(.black)
                .tabItem {
                    Label("Standings", systemImage: "arrow.up.to.line")
                }
            NewsScreen()
                .background(.black)
                .tabItem {
                    Label("Races", systemImage: "person")
                }
        }
        .accentColor(.red)
        .colorScheme(.dark)
    }
}

struct LandingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreenView()
    }
}

