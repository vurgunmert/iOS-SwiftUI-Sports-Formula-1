//
//  TeamMiniView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct TeamMiniView: View {
    
    let model: TeamModel
    
    var body: some View {
        HStack {
            Text(String(model.position))
                .foregroundColor(.orange)
                .bold()
                .font(.system(size: 25, weight: .heavy))
            Text(model.name)
                .padding(.leading, 12)
                .foregroundColor(.black)
                .bold()
                .font(.system(size: 20, weight: .heavy))
            Spacer()
            Text(String(model.points) + "\n pts")
                .padding(.leading, 12)
                .foregroundColor(.black)
                .bold()
                .font(.system(size: 20, weight: .heavy))
        }
        .padding(10)
    }
}

struct TeamMiniView_Previews: PreviewProvider {
    static var previews: some View {
        TeamMiniView(model: TeamModel(position: 1,
                                      name: "Red Bull Racing",
                                      points: 503))
    }
}
