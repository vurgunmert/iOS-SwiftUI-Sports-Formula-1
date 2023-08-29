//
//  DriverDetailScreen.swift
//  sports-formula1
//
//  Created by user on 29.08.2023.
//

import SwiftUI
import Kingfisher

struct DriverDetailScreen: View {
    
    var driver: DriverCardModel
    var team: TeamCardModel
    
    var body: some View {
        
        VStack {
            Text("Driver Details Screen")
            
            KFImage.url(URL(string: driver.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(driver.lastName)
            Text(driver.firstName)
            
            
            KFImage.url(URL(string: team.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct DriverDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailScreen(driver: alonzoCard, team: astonCard)
    }
}
