//
//  RaceDetailScreen.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI

struct RacesScreen: View {
    
    @EnvironmentObject var catalog: Catalog
    
    @State private var selectedTab = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            Tabs(tabs: .constant(["Completed", "Upcoming"]),
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
                        ForEach(catalog.completedRaces) { model in
                            RaceCard(model: model)
                        }
                    }
                }.scrollIndicators(.hidden)
                
            } else {
                
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(catalog.scheduledRaces) { model in
                            RaceCard(model: model)
                        }
                    }
                }.scrollIndicators(.hidden)
            }
        }.padding(10)
            .onAppear{
                
                
                catalog.loadRaceCardsRaw()
                
            }
    }
}

struct RacesScreen_Previews: PreviewProvider {
    static var previews: some View {
        RacesScreen()
    }
}
