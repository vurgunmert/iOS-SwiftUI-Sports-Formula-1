//
//  DriverDetailScreen.swift
//  sports-formula1
//
//  Created by user on 29.08.2023.
//

import SwiftUI

struct DriverDetailScreen: View {
    
    var model: DriverCardModel
    
    var body: some View {
        VStack {
            
            Text("Driver Detail Screen")
            
            Text(model.lastName)
            
            Text(model.imageUrl)
        }
    }
}

struct DriverDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailScreen(model: alonzoCard)
    }
}
