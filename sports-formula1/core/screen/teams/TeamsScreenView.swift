//
//  TeamsScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct TeamsScreenView: View {
    
    @StateObject var viewModel = TeamsViewModel()
    
    var body: some View {
        List(viewModel.models) { model in
            TeamView(model: model)
        }
        .frame(maxWidth: .infinity)
        .listStyle(GroupedListStyle())
        .padding(.top)
        .background(.black)
    }
}

struct TeamsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsScreenView()
    }
}
