//
//  CircuitsScreenView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI

struct CircuitsScreenView: View {
    
    @EnvironmentObject var catalog: Catalog
    
    var body: some View {
        List(catalog.circuits) { model in
            CircuitView(model: model)
        }
        .listStyle(GroupedListStyle())
        .task {
            do {
                try await catalog.loadCircuits()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct CircuitsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitsScreenView()
    }
}
