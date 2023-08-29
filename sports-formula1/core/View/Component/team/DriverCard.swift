//
//  DriverCard.swift
//  sports-formula1
//
//  Created by Vurgun on 28.08.2023.
//

import SwiftUI
import Kingfisher

struct DriverCardModel: Identifiable, Hashable {
    var id: UUID = .init()
    var firstName: String
    var lastName: String
    var position: Int
    var points: Int
    var driverNo: Int
    var imageUrl: String
    var teamImageUrl: String
    var mainColor: Color
}

struct DriverCard: View {
        
    var model: DriverCardModel = maxCard
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: [.white, model.mainColor, model.mainColor, .black]),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
            
            
            Text("\(model.driverNo)")
                .font(.system(size: 111, weight: .ultraLight, design: .serif))
                .padding(.leading, 120)
                .padding(.top, 30)
                .foregroundColor(.black.opacity(0.3))
                .frame(width: 230, alignment: .center)
            
            
            
            VStack(alignment: .leading) {
                KFImage.url(URL(string: model.teamImageUrl))
                    .resizable()
                    .colorMultiply(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(.leading, 20)
                
                HStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 1, height: 45)
                    VStack(alignment: .leading) {
                        Text(model.firstName)
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light, design: .rounded))
                        Text(model.lastName)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                    }
                }.padding(.leading, 20)
                    .padding(.top, -20)
                
                Spacer()
                
                Text("\(model.points) pts")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .heavy, design: .rounded))
                    .padding(.leading, 30)
                    .padding(.bottom, 15)
                
            }
            
            HStack(alignment: .top) {
                
                Spacer()
                
                KFImage.url(URL(string: model.imageUrl))
                    .resizable()
                    .colorMultiply(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding(.trailing)
            }
            
            Text("\(model.position)")
                .foregroundColor(.white)
                .frame(width: 50, alignment: .center)
                .font(.system(size: 50, weight: .heavy, design: .serif))
                .padding(.leading, 320)
                .padding(.bottom, 120)
            
        }.frame(height: 200)
    }
}

struct DriverCard_Previews: PreviewProvider {
    static var previews: some View {
        DriverCard()
    }
}
