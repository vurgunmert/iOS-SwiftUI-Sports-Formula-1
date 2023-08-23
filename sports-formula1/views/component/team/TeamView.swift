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
        VStack {
            
            HStack {
                Text(String(model.rank))
                    .bold()
                    .font(.system(size: 30, weight: .heavy))
                Spacer()
                Text("\(model.points)\nPTS")
            }
            
            Text(model.name)
                .bold()
                .font(.system(size: 28))
            
            KFImage.url(URL(string: model.imageUrl))
            
            HStack {
                
                Text(model.driver1Name)
                    .bold()
                    .font(.system(size: 28))
                
                Spacer()
                
                Text(model.driver2Name)
                    .bold()
                    .font(.system(size: 28))
                
            }
            
        }
        .frame(width: 300)
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(model: TeamModel(rank: 1,
                                  name: "Red Bull Racing",
                                  points: 503,
                                  imageUrl: "https://media.api-sports.io/formula-1/teams/1.png",
                                  driver1Name: "Max Verstappen",
                                  driver2Name: "Sergio Perez"))
    }
}
