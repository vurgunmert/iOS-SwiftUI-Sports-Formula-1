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
                    Label("News", systemImage: "doc.richtext")
                        .tint(.red)
                }
            StandingsScreen()
                .background(.black)
                .tabItem {
                    Label("Standings", systemImage: "tray.and.arrow.up.fill")
                }
            RaceDetailScreen()
                .background(.black)
                .tabItem {
                    Label("Races", systemImage: "flag.fill")
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

