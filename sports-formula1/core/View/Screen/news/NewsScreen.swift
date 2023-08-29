//
//  NewsScreen.swift
//  sports-formula1
//
//  Created by Vurgun on 28.08.2023.
//

import SwiftUI

struct NewsScreen: View {
    
    var body: some View {
        
        GeometryReader { screenGeometry in
            let size = screenGeometry.size
            let carouselContainerSize: CGSize = .init(width: size.width, height: size.height/2.5)
            
            VStack {

                ScrollView(.vertical) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        Text("All News")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.red)
                            .padding(.bottom, -1)
                            .padding(.leading)
                        
                        DetailedNewsCarousel(posts: dummyCarouselNews.shuffled())
                            .frame(width: carouselContainerSize.width, height: carouselContainerSize.height)
                        
                        HorizontalNewsFeed(title: "Top Stories", items: dummyAllNews.shuffled())
                            .padding(.top, 50)
                        
                        HorizontalNewsFeed(title: "Featured News", items: dummyAllNews.shuffled())
                        
                        HorizontalNewsFeed(title: "More News", items: dummyAllNews.shuffled())
                    }
                }
            }
        }
        .background(.black.opacity(0.9))
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
