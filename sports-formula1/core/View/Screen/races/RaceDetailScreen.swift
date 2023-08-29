//
//  RaceDetailScreen.swift
//  sports-formula1
//
//  Created by user on 29.08.2023.
//

import SwiftUI

struct RaceDetailScreen: View {
    
    var model: RaceCardModel
    
    var body: some View {
        VStack {
            
            Text("Race Detail Screen")
            Text(model.name)
            Text(model.country)
        }
    }
}

struct RaceDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailScreen(model: canadaRaceCard)
    }
}
