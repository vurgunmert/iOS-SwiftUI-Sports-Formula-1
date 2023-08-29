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
        
        HStack(alignment: .top) {
            Text(String(model.position))
                .bold()
                .font(.system(size: 40, weight: .heavy))
                .padding(.trailing)
            Spacer()
            VStack(alignment: .leading) {
                Text("\(model.points) pts")
                    .font(.system(size: 30, weight: .semibold))
                
                if let imageUrl = model.imageUrl {
                    
                    KFImage.url(URL(string: imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
            }
            .frame(width: 250)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.black, lineWidth: 4)
            )
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(model: TeamModel(id: 2,
                                  position: 1,
                                  name: "Red Bull Racing",
                                  points: 503,
                                  imageUrl: "https://media.api-sports.io/formula-1/teams/1.png"))
    }
}
