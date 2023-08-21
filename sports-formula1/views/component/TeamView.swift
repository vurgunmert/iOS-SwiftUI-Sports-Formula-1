//
//  TeamView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 21.08.2023.
//

import SwiftUI

struct TeamView: View {
    var body: some View {
        HStack {
            Text("1")
            Spacer()
            Text("Red Bull")
                .bold()
                .font(.system(size: 28))
            Spacer()
            Text("123\nPTS")
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
        .background(Color.orange)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 4)
        .padding(16)
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
