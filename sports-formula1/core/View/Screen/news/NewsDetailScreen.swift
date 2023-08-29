//
//  NewsDetailScreen.swift
//  sports-formula1
//
//  Created by user on 29.08.2023.
//

import SwiftUI

struct NewsDetailScreen: View {
    
    var model: NewsPost
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                Text("News Detail Screen")
                
                Image(model.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(model.title!)
                    .bold()
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(.red)
                    .padding(12)
                
                Text(model.memo ?? "...")
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(.black)
                    .padding(12)
                
            }
        }
    }
}

struct NewsDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailScreen(model: dummyAllNews.randomElement()!)
    }
}
