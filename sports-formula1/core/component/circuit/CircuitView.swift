//
//  CircuitView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI
import Kingfisher

struct CircuitView: View {
    
    let model: CircuitModel
    
    var body: some View {
        
        VStack {
            
            VStack {
                Text(model.name)
                    .font(.system(size: 25, weight: .heavy))
                Text(model.city + ", " + model.country)
            }
            
            KFImage(URL(string: model.imageUrl))
            
            HStack {
                VStack {
                    Text("First Grand Prix")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .medium))
                    Text(String(model.firstGrandPrixYear))
                }
                Spacer()
                VStack {
                    Text("Number of Laps")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .medium))
                    Text(String(model.lapCount))
                }
            }
            .padding(10)
            
            HStack {
                VStack {
                    Text("Circuit Length")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .medium))
                    Text(String(model.length))
                }
                Spacer()
                VStack {
                    Text("Race Distance")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .medium))
                    Text(String(model.raceLength))
                }
            }
            .padding(10)
            
            VStack(alignment: .leading) {
                Text("Lap Record")
                    .foregroundColor(.red)
                    .font(.system(size: 20, weight: .medium))
                Text(String(model.lapRecord.time))
                Text(model.lapRecord.driverName)
                Text(model.lapRecord.year)
            }
            .padding(10)
        }.frame(width: 350)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.black, lineWidth: 4)
            )
    }
}

struct CircuitView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitView(model: CircuitModel(id:1,
                                        name: "Albert Park Circuit",
                                        imageUrl: "https://media-1.api-sports.io/formula-1/circuits/1.png",
                                        city: "Melbourne",
                                        country: "Australia",
                                        firstGrandPrixYear: 1996,
                                        lapCount: 58,
                                        length: "5.303 Kms",
                                        raceLength: "307.574 kms",
                                        lapRecord: CircuitModel.LapRecord(time: "1:24.125",
                                                                          driverName: "Michael Schumacher",
                                                                          year: "2004")))
    }
}
