//
//  SnapCarouselTest.swift
//  sports-formula1
//
//  Created by user on 27.08.2023.
//

import SwiftUI


struct NewsCarousel: View {
    
    @State var currentIndex: Int = 0
    
    @State var posts: [Post] = [
        .init(image: "news1", title: "1st News"),
        .init(image: "news2", title: "2nd News"),
        .init(image: "news3", title: "3rd News"),
        .init(image: "news4", title: "4th News"),
    ]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            //Carousel
            SnapCarousel(index: $currentIndex, items: posts) { post in
                
                let index = posts.firstIndex(of: post)
                
                GeometryReader { cardGeometry in
                    let size = cardGeometry.size
                    
                    ZStack(alignment: .topTrailing) {
                        Image(post.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text(post.title)
                            .font(.system(.headline))
                            .foregroundColor(.red)
                            .padding(10)
                    }.frame(width: size.width)
                        .cornerRadius(10)
                        .if(currentIndex == index) {
                            $0.overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.orange, lineWidth: 2)
                                    .opacity(currentIndex == index ? 1: 0)
                            ).shadow(color: .green, radius: 2)
                        }
                }
            }
            .padding(.top, 20)
            
            //Indicator
            HStack(spacing: 8) {
                ForEach(posts.indices, id: \.self) { index in
                    
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 12, height: 12)
                        
                        Circle()
                            .fill(currentIndex == index ? .white : .white.opacity(0.2))
                            .frame(width: 10, height: 10)
                            .animation(.spring(), value: currentIndex == index)
                    }
                }
            }
            .padding(.trailing, 50)
            .padding(.bottom, 30)
        }.frame(height: 230)
    }
}

struct SnapCarouselTest_Previews: PreviewProvider {
    static var previews: some View {
        NewsCarousel()
    }
}
