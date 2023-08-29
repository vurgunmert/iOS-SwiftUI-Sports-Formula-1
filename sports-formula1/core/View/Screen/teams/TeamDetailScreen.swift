//
//  TeamDetailScreen.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI
import Kingfisher


struct TeamDetailScreen: View {
    
    @EnvironmentObject var navigator: Navigator
    
    var model: TeamCardModel
    
    var body: some View {
        
        VStack {
            Text("Team Details Screen")
            
            KFImage.url(URL(string: model.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(model.name)
            
            DriverCard(model: model.driver1)
                .onTapGesture {
                    navigator.addRoute(.driverDetail(model.driver1, model))
                }
            
            DriverCard(model: model.driver2)
                .onTapGesture {
                    navigator.addRoute(.driverDetail(model.driver2, model))
                }
        }
    }
}

struct TeamDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailScreen(model: astonCard)
    }
}


