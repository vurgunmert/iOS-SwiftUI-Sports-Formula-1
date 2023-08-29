//
//  ExperimentHome.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import SwiftUI

struct DetailedNewsCarousel: View {
    
    private var scrollViewTopViewId: Int = 0
    @State private var posts: [NewsPost]
    @State private var currentPost: NewsPost
    
    init(posts: [NewsPost]) {
        self._posts = State(initialValue: posts)
        self._currentPost = State(initialValue: posts.first!)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                NewsCarousel(items: posts,
                             onSnapped: { post in
                    //On carousel snapped
                    currentPost = post
                }, onSelected: { post in
                    //On carousel selected
                })
                
                Text(currentPost.title!)
                    .frame(width: .infinity, height: 80, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.horizontal, 20)
            }.frame(width: size.width, height: 320)
        }
    }
}

struct DetailedNewsCarousel_Previews: PreviewProvider {
    static var previews: some View {
        DetailedNewsCarousel(posts: dummyAllNews)
            .background(.black)
    }
}
