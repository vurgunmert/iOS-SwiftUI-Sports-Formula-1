//
//  ExperimentNewsLanding.swift
//  sports-formula1
//
//  Created by Vurgun on 28.08.2023.
//

import SwiftUI

struct HorizontalNewsFeed: View {
    
    @EnvironmentObject var navigator: Navigator
    var title: String
    @State var items: [NewsPost]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .padding(.leading)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(.red)
                .padding(.bottom, -1)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(items) { item in
                        
                        VStack {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text(item.title!)
                                .font(.system(size: 18, design: .rounded))
                                .foregroundColor(.black)
                                .lineLimit(3)
                                .padding(.horizontal, 8)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 300)
                        .background(.white)
                        .cornerRadius(20, corners: .topLeft)
                        .cornerRadius(20, corners: .bottomRight)
                        .listRowSeparator(.hidden)
                        .offset(x: 15)
                        .onTapGesture {
                            navigator.addRoute(.newsDetail(item))
                        }
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            .shadow(radius: 8)
            
        }
    }
}

struct HorizontalNewsFeed_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalNewsFeed(title: "Top Stories", items: dummyAllNews)
    }
}
