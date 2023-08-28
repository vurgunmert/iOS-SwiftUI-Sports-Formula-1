//
//  HomeCarousels.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI

struct ExperimentCarousels: View {
    @State var currentIndex: Int = 0
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            CarCarouselScrollView()
                .frame(height: 50)
            
            Spacer()
                .background(.white)
                .frame(height: 10)
            
            CarCarouselTabView()
                .frame(height: 130)
            
            Spacer()
                .background(.white)
                .frame(height: 10)
            
            NewsCarousel<NewsPost>(items: dummyCarouselNews)
            
            Spacer()
        }
    }
}

struct ExperimentCarousels_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentCarousels()
    }
}
