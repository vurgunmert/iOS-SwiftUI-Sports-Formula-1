//
//  SnapCarouselTest.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI


struct NewsCarousel<T: CarouselItem>: View {
    
    @State var items: [T]
    
//    @State private var carouselIndex: Int = 0
    
    @State private var currentIndex: Int = 0
        
    private var onItemSnappedBehavior: ((T) -> ())? = nil
    private var onItemSelectedBehavior: ((T) -> ())? = nil
        
    init(items: [T],
         onSnapped: ((T) -> ())? = nil,
         onSelected: ((T) -> ())? = nil) {
        self.items = items
        self.onItemSnappedBehavior = onSnapped
        self.onItemSelectedBehavior = onSelected
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            //Carousel
            SnapCarousel(index: $currentIndex, items: items) { item in
                let index = items.firstIndex(of: item)
                GeometryReader { cardGeometry in
                    let size = cardGeometry.size
                    
                    ZStack(alignment: .center) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        //any view overlay
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
            .onChange(of: currentIndex, perform: { idx in
                onItemSnappedBehavior?(items[idx])
            })
            
            //Indicator
            HStack(spacing: 8) {
                ForEach(items.indices, id: \.self) { index in
                    
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
        }
        .onTapGesture {
            onItemSelectedBehavior?(items[currentIndex])
        }
    }
    
}

struct SnapCarouselTest_Previews: PreviewProvider {
    static var previews: some View {
        @State var currentIndex: Int = 0
        
        NewsCarousel<NewsPost>(items: dummyCarouselNews)
            .background(.red)
    }
}
