//
//  TeamView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI
import Kingfisher

struct TeamView: View {
    
    let model: TeamModel
    
    var body: some View {
        VStack(alignment: .center) {
            
            HStack {
                Text(String(model.position))
                    .bold()
                    .font(.system(size: 30, weight: .heavy))
                Spacer()
                Text("\(model.points)\nPTS")
            }
            
            Text(model.name)
                .bold()
                .font(.system(size: 28))
            
            if let imageUrl = model.imageUrl {
                KFImage.url(URL(string: imageUrl))
            }
            
            if let driver1Name = model.driver1Name, let driver2Name = model.driver2Name {
                HStack {
                    
                    Text(driver1Name)
                        .bold()
                        .font(.system(size: 28))
                    
                    Spacer()
                    
                    Text(driver2Name)
                        .bold()
                        .font(.system(size: 28))
                    
                }
            }
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(model: TeamModel(position: 1,
                                  name: "Red Bull Racing",
                                  points: 503,
                                  imageUrl: "https://media.api-sports.io/formula-1/teams/1.png",
                                  driver1Name: "Max Verstappen",
                                  driver2Name: "Sergio Perez"))
    }
}
