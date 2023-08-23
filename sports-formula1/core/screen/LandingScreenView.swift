//
//  LandingScreenView.swift
//  sports-formula1
//
//  Created by user on 23.08.2023.
//

import SwiftUI

struct LandingScreenView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            RacesScreenView()
                .tabItem {
                    Label("Races", systemImage: "arrow.up.to.line")
                }
            DriversScreenView()
                .tabItem {
                    Label("Drivers", systemImage: "person")
                }
            TeamsScreenView()
                .tabItem {
                    Label("Teams", systemImage: "folder")
                }
            CircuitsScreenView()
                .tabItem {
                    Label("Circuits", systemImage: "arrow.2.squarepath")
                }
        }
    }
}

struct LandingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreenView()
    }
}
