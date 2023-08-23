//
//  DriverView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI
import Kingfisher

struct DriverView: View {
    
    let driver: DriverModel
    
    var body: some View {
        
        
        VStack() {
            
            HStack(alignment: .top) {
                Text(String(driver.rank))
                    .foregroundColor(.black)
                    .bold()
                    .font(.system(size: 40, weight: .heavy))
                Spacer()
                VStack{
                    Text(String(driver.points))
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 30, weight: .heavy))
                    Text("PTS")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                }
            }
            
            Divider()
            
            HStack {
                Text(driver.name)
                Spacer()
                Text(flag(from: driver.countryCode))
            }
            
            Divider()
            
            Text(driver.teamName)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .bottom) {
                Text(String(driver.driverNo))
                    .foregroundColor(.red)
                    .bold()
                    .font(.system(size: 80, weight: .heavy))
                KFImage.url(URL(string: driver.imageUrl))
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

struct DriverView_Previews: PreviewProvider {
    
    static var previews: some View {
        DriverView(driver: DriverModel(rank: 1,
                                       points: 314,
                                       name: "Max Verstappen",
                                       countryCode: "NL",
                                       teamName: "Red Bull Racing",
                                       driverNo: 1,
                                       imageUrl: "https://media-3.api-sports.io/formula-1/drivers/25.png"))
    }
}
