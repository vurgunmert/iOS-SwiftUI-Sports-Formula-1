//
//  DriversScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct StandingsScreen: View {
    
    
    @State private var selectedTab = 0

    var body: some View {
        
        VStack(spacing: 20) {
            Tabs(tabs: .constant(["Drivers", "Teams"]),
                 selection: $selectedTab,
                 underlineColor: .red) { title, isSelected in
                Text(title.uppercased())
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .foregroundColor(isSelected ? .red : .gray)
            }
            
            if selectedTab == 0 {
                
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(dummyDriverCards) { model in
                            DriverCard(model: model)
                        }
                    }
                }.scrollIndicators(.hidden)
                
            } else {
                
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(dummyTeamCards) { model in
                            TeamCard(model: model)
                                .padding(.top, 30)
                        }
                    }
                }.scrollIndicators(.hidden)
            }
        }.padding(10)
    }
}

struct StandingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsScreen()
            .background(.black)
    }
}
