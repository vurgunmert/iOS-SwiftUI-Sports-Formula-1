//
//  RaceDetailScreen.swift
//  sports-formula1
//
//  Created by user on 29.08.2023.
//

import SwiftUI
import Kingfisher

struct RaceDetailScreen: View {
    
    var model: RaceCardModel
    
    var body: some View {
        VStack {
            Text("Race Detail Screen")
            
            KFImage.url(URL(string: model.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(model.name)
        }
    }
}

struct RaceDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailScreen(model: canadaRaceCard)
    }
}
