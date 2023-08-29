//
//  NextRaceView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 21.08.2023.
//

import SwiftUI



struct LastRaceView: View {
    let name: String
    let date: String
    let circuitName: String
    let driver1: String
    let driver2: String
    let driver3: String
    let driver1Time: String
    let driver2Time: String
    let driver3Time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 28))
            Text(date)
                .foregroundColor(.white)
            Text(circuitName)
                .foregroundColor(.white)
            HStack {
                Text(driver1)
                    .foregroundColor(.white)
                Text(driver1Time)
                    .foregroundColor(.white)
            }.padding(.top, 10)
            
            HStack {
                Text(driver2)
                    .foregroundColor(.white)
                Text(driver2Time)
                    .foregroundColor(.white)
            }
            
            HStack {
                Text(driver3)
                    .foregroundColor(.white)
                Text(driver3Time)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
        .background(Color.red)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 4)
        .padding(16)
    }
}

struct LastRaceView_Previews: PreviewProvider {
    static var previews: some View {
        LastRaceView(
            name: "Netherlands Grand Prix",
            date: "2023-08-27T13:00:00+00:00",
            circuitName: "Circuit Zandvoort",
            driver1: "Max Verstappen",
            driver2: "Sergio Perez",
            driver3: "Charles Leclerc",
            driver1Time: "1:02:03",
            driver2Time: "+12:04",
            driver3Time: "+16:05"
        )
    }
}
