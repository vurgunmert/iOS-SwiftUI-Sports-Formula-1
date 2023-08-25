//
//  CircuitsScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct CircuitsScreenView: View {
    
    @StateObject var viewModel = CircuitsViewModel()
    
    var body: some View {
        List(viewModel.models) { model in
            CircuitView(model: model)
        }
        .frame(maxWidth: .infinity)
        .listStyle(GroupedListStyle())
        .padding(.top)
        .background(.black)
    }
}

struct CircuitsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitsScreenView()
    }
}
