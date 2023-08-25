//
//  HomeScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct HomeScreenView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        List {
            
            ForEach(viewModel.raceSummaries, content: { model in
                
                if model.dateTime?.timeIntervalSinceNow ?? 0 > 0 {
                    Text("Next")
                        .font(.system(size: 24, weight: .thin))
                } else {
                    Text("Previous")
                        .font(.system(size: 24, weight: .thin))
                }
                
                RaceSummaryView(model: model)
                    .shadow(radius: 2)
                    .listRowSeparator(.hidden)
            })
            
            Text("Top Teams")
                .font(.system(size: 24, weight: .thin))
                .padding(.top, 30)
            
            ForEach(viewModel.teams) { model in
                TeamMiniView(model: model)
            }
            
        }
        .frame(maxWidth: .infinity)
        .listStyle(GroupedListStyle())
        .padding(.top)
        .background(.black)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
