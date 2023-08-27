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
        
        
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                
                /// TopBar
                HStack(spacing: 12) {
                    Button(action: {}, label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundStyle(.blue)
                    })
                    
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        
                        TextField("Search", text: $searchText)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .strokeBorder(Color.black,lineWidth: 0.8)
                            .background(Color.gray)
                            .opacity(0.2)
                            .clipped()
                    )
                    .clipShape(Capsule())
                }
                
                /// Car Carousel
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
                                .frame(width: size.width - 40, height: size.height - 60)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .scrollIndicators(.hidden)
                })
                .frame(width: .infinity, height: 200)
                
            }.padding(15)
        }
        
    }
}

struct CarCarouselScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CarCarouselScrollView()
    }
}
