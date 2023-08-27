//
//  SnapCarousel.swift
//  sports-formula1
//
//  Created by user on 27.08.2023.
//

import SwiftUI

struct SnapCarousel<Content: View, T: CarouselItem>: View {
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    init(spacing: CGFloat = 15,
         trailingSpace: CGFloat = 50,
         index: Binding<Int>,
         items: [T],
         @ViewBuilder content: @escaping (T)->Content) {
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            
            //setting correct width for snapped card
            
            //one sided
            let width = proxy.size.width - (trailingSpace - spacing)
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    
                    let index = list.firstIndex(of: item)
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                        .scaleEffect(index == currentIndex ? 1.03 : 1)
                }
            }
            // Spacing will be horizontal padding...
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width ) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        // updating current index
                        let offsetX = value.translation.width
                        // were going to convert the translation
                        // into progress 0 - 1
                        // and roung the value..
                        // based on progress incr or desc the currentIndex...
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        //updading index?
                        currentIndex = index
                    })
                    .onChanged({ value in
                        // updating current index
                        let offsetX = value.translation.width
                        // were going to convert the translation
                        // into progress 0 - 1
                        // and roung the value..
                        // based on progress incr or desc the currentIndex...
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        // animating when offset 0
        .animation(.easeInOut, value: offset == 0)
    }
    
}
