//
//  RaceCard.swift
//  sports-formula1
//
//  Created by user on 29.08.2023.
//

import SwiftUI
import Kingfisher

struct RaceCardModel: Identifiable {
    var id: Int
    var dateTime: String
    var country: String
    var name: String
    var imageUrl: String = dummyRaceImageUrls.randomElement()!
    var completed: Bool
}

struct RaceCard: View {
    
    var model: RaceCardModel = canadaRaceCard
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ZStack(alignment: .bottomLeading) {
                KFImage.url(URL(string: model.imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                HStack {
                    if model.completed {
                        Image(systemName: "play")
                            .foregroundColor(.white)
                        
                        Text("Race Highlights")
                            .foregroundColor(.white)
                            .font(.system(.subheadline, weight: .bold))
                    } else {
                        
                        Image(systemName: "qrcode.viewfinder")
                            .foregroundColor(.white)
                        
                        Text("Buy Tickets")
                            .foregroundColor(.white)
                            .font(.system(.subheadline, weight: .bold))
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(.red)
                .cornerRadius(12, corners: .topLeft)
                .cornerRadius(12, corners: .topRight)
                .cornerRadius(12, corners: .bottomRight)
            }
            
            HStack() {
                
                VStack(alignment: .leading) {
                    Text(model.dateTime)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                    Text(model.country)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .heavy, design: .monospaced))
                }.padding(.leading)
                Spacer()
                Image(systemName: "chevron.compact.right")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 6, height: 40)
            }.padding(8)
            
            Text(model.name)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .light, design: .rounded))
                .padding(.leading, 24)
            
            Button(role: .none, action: {
                
            }, label: {
                Text("REVEAL RESULTS")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .heavy, design: .rounded))
                    .padding(12)
                    .background(.black.opacity(0.3))
                    .cornerRadius(12, corners: .allCorners)
            })
            .padding(.horizontal, 10)
            .padding(.bottom)
            .frame(maxWidth: .infinity)
            
        }
        .background(.gray.opacity(0.3))
        .cornerRadius(20, corners: .allCorners)
    }
}

struct RaceCard_Previews: PreviewProvider {
    static var previews: some View {
        RaceCard()
    }
}
