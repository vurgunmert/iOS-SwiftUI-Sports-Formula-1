//
//  NextRaceView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 21.08.2023.
//

import SwiftUI

struct NextRaceView: View {
    let name: String
    let date: String
    let circuitName: String
    
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
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10))
        .background(Color.black)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 4)
        .padding(16)
    }
}

struct NextRaceView_Previews: PreviewProvider {
    static var previews: some View {
        NextRaceView(
            name: "Netherlands Grand Prix",
            date: "2023-08-27T13:00:00+00:00",
            circuitName: "Circuit Zandvoort"
        )
    }
}
