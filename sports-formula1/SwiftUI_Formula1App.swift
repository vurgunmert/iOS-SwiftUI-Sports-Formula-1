//
//  sports_formula1App.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 19.08.2023.
//

import SwiftUI

@main
struct SwiftUI_Formula1App: App {
    
    var body: some Scene {
        WindowGroup {
            LandingScreenView()
                .environmentObject(Ranking(client: ApiSportsHttpClient()))
                .environmentObject(Catalog(client: ApiSportsHttpClient()))
        }
    }
}
