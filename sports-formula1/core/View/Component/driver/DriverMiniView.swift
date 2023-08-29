//
//  DriverMiniView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct DriverMiniView: View {
    
    let rank: Int
    let name: String
    let data: String
    
    var body: some View {
        HStack {
            Text(String(rank))
                .foregroundColor(.orange)
                .bold()
                .font(.system(size: 25, weight: .heavy))
            Text(name)
                .padding(.leading, 30)
                .frame(width: .infinity)
                .foregroundColor(.black)
                .bold()
                .font(.system(size: 20, weight: .heavy))
            Spacer()
            Text(data )
                .padding(.leading, 30)
                .foregroundColor(.black)
                .bold()
                .font(.system(size: 20, weight: .heavy))
        }
        .padding(10)
    }
}

struct DriverMiniView_Previews: PreviewProvider {
    static var previews: some View {
        DriverMiniView(rank: 1, name: "Max Verstappen", data: "1:23:456")
    }
}


struct DriverMiniView_Previews2: PreviewProvider {
    static var previews: some View {
        DriverMiniView(rank: 11, name: "Sergio Perez", data: "+13:41")
    }
}
