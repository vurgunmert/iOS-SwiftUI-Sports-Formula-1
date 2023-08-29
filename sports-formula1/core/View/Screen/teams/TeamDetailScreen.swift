//
//  TeamDetailScreen.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI

struct TeamDetailScreen: View {
    
    var model: TeamCardModel
    
    var body: some View {
        VStack {
            Text("Team Details Screen")
        
            Text(model.name)
            
            Text(model.imageUrl)
        }
    }
}

struct TeamDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailScreen(model: astonCard)
    }
}
