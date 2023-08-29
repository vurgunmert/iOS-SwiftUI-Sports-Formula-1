//
//  TeamCard.swift
//  sports-formula1
//
//  Created by Vurgun on 28.08.2023.
//

import SwiftUI
import Kingfisher

struct TeamCardModel: Identifiable, Hashable {
    var id: UUID = .init()
    var name: String
    var imageUrl: String
    var mainColor: Color
    var position: Int
    var points: Int
    var driver1: DriverCardModel
    var driver2: DriverCardModel
}

struct TeamCard: View {
    
    var model: TeamCardModel = merdecesCard
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: [.white, model.mainColor, model.mainColor, .black]),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .opacity(0.6)
            
            
            KFImage.url(URL(string: model.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .cornerRadius(25, corners: .topLeft)
                .cornerRadius(25, corners: .bottomRight)
                .opacity(0.7)
            
            Text(model.name)
                .foregroundColor(.black.opacity(0.7))
                .font(.system(size: 28, weight: .heavy, design: .monospaced))
                .padding(.top, 180)
                .padding(.leading)
                .padding(.bottom)
            
            HStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: 1, height: 45)
                VStack(alignment: .leading) {
                    Text(model.driver1.firstName)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                    Text(model.driver1.lastName)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                
                Rectangle()
                    .frame(width: 1, height: 45)
                VStack(alignment: .leading) {
                    Text(model.driver2.firstName)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                    Text(model.driver2.lastName)
                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                }
                
                Spacer()
            }
            .padding(.top, 120)
            .padding(.leading)
            
            Text("\(model.points)\nPTS")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .padding(.leading, 300)
                .padding(.top, 140)

            
            Text("\(model.position)")
                .foregroundColor(.white)
                .frame(width: 50, alignment: .center)
                .font(.system(size: 50, weight: .heavy, design: .serif))
                .padding(.leading, 320)
                .padding(.bottom, 120)

        }.frame(height: 200)
    }
}

struct TeamCard_Previews: PreviewProvider {
    static var previews: some View {
        TeamCard()
    }
}
