//
//  ExperimentHome.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI
import AVKit

struct ExperimentNewsCarouselBehaviors: View {
    
    @State var currentPost: NewsPost = dummyCarouselNews.first!
    private var scrollViewTopViewId: Int = 0
    
    var body: some View {
        
        GeometryReader { screenGeometry in
            let size = screenGeometry.size
            let carouselContainerSize: CGSize = .init(width: size.width, height: size.height/3.5)
            
            VStack {
                NewsCarousel(items: dummyCarouselNews,
                             onSnapped: { post in
                    //On carousel snapped
                    currentPost = post
                }, onSelected: { post in
                    //On carousel selected
                })
                .frame(width: carouselContainerSize.width, height: carouselContainerSize.height)

                Text(currentPost.title!)
                    .id(scrollViewTopViewId)
                    .font(.headline)
                    .padding(.horizontal, 20)
                
                Divider()
                
                
                //                ScrollViewReader { scrollProxy in
                //
                //                    ScrollView(.vertical) {
                //                        VStack {
                //
                //
                ////
                ////                            Text(currentPost.memo)
                ////                                .font(.subheadline)
                ////                                .padding(.vertical,10)
                ////                                .padding(.horizontal, 20)
                //                        }
                //                        .onChange(of: currentPost) { _ in
                //                            withAnimation {
                //                                scrollProxy.scrollTo(scrollViewTopViewId, anchor: .top)
                //                            }
                //                        }
                //
                //                    }
                //                }
                
            }
        }
    }
}

struct ExperimentNewsCarouselBehaviors_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentNewsCarouselBehaviors()
    }
}
