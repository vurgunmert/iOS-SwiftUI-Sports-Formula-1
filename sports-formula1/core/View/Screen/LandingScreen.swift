//
//  LandingScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct LandingScreenView: View {
    
    @EnvironmentObject private var navigator: Navigator
    
    var body: some View {
        
        NavigationStack(path: $navigator.path) {
            
            TabView {
                NewsScreen()
                    .tabItem {
                        Label("News", systemImage: "doc.richtext")
                            .tint(.red)
                    }
                StandingsScreen()
                    .background(.black)
                    .tabItem {
                        Label("Standings", systemImage: "tray.and.arrow.up.fill")
                    }
                RacesScreen()
                    .background(.black)
                    .tabItem {
                        Label("Races", systemImage: "flag.fill")
                    }
            }
            .accentColor(.red)
            .colorScheme(.dark)
            .navigationDestination(for: ScreenRoute.self, destination: { route in
                switch(route) {
                    case .newsDetail(let item):
                        NewsDetailScreen(model: item)
                    case .driverDetail:
                        DriverDetailScreen()
                    case .teamDetail:
                        TeamDetailScreen()
                    case .raceDetail:
                        RaceDetailScreen()
                }
            })
        }
    }
}

struct LandingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreenView()
    }
}

