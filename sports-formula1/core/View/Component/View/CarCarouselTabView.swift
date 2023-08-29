//
//  CarCarouselSnapView.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI

struct CarouselPage: Identifiable, Hashable {
    var id: UUID = .init()
    var card: CarCard
}

struct CarCarouselTabView: View {
    
    @State private var currentPage: String = ""
    @State private var listOfPage: [CarouselPage] = [
        .init(card: formulaCards[0]),
        .init(card: formulaCards[1]),
        .init(card: formulaCards[2]),
        .init(card: formulaCards[3])
    ]
    
    var body: some View {
        
        GeometryReader { geometry in
            let size = geometry.size
            
            TabView(selection: $currentPage, content: {
                
                ForEach(formulaCards, content: { card in
                    GeometryReader(content: { proxy in
                        let cardSize = proxy.size
                        
                        Image(card.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15.0)
                            .frame(width: cardSize.width, height: cardSize.height)
                            .shadow(radius: 8)
                    })
                    .frame(width: size.width - 50)
                })
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct CarCarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarCarouselTabView()
    }
}
