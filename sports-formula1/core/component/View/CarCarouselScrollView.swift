//
//  CarCarouselView.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI

struct CarCarouselScrollView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            let size = geometry.size
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    
                    ForEach(formulaCards) { card in
                        
                        GeometryReader(content: { proxy in
                            let cardSize = proxy.size
                            
                            Image(card.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15.0)
                                .frame(width: cardSize.width, height: cardSize.height)
                                .shadow(radius: 8)
                        })
                        .frame(width: size.width - 40)
                        .background(.blue)
                    }
                }
                .padding(.horizontal, 10)
                .background(.green)
            }
            .scrollIndicators(.hidden)
            .background(.black)
        })
    }
}

struct CarCarouselScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CarCarouselScrollView()
    }
}
