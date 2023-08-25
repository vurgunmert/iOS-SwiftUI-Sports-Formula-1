//
//  DriversScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct DriversScreenView: View {
    
    @StateObject var viewModel = DriversViewModel()
    
    var body: some View {
        
        List(viewModel.models) { model in
            DriverView(model: model)
        }
        .frame(maxWidth: .infinity)
        .listStyle(GroupedListStyle())
        .padding(.top)
        .background(.black)
    }
}

struct DriversScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DriversScreenView()
    }
}
