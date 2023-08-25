//
//  RacesScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct RacesScreenView: View {
    
    @StateObject var viewModel = RacesViewModel()
    
    var body: some View {
        
        List(viewModel.models) { model in
            RaceSummaryView(model: model)
        }
        .frame(maxWidth: .infinity)
        .listStyle(GroupedListStyle())
        .padding(.top)
        .background(.black)
    }
}

struct RacesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RacesScreenView()
    }
}
