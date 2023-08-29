//
//  RaceDetailScreen.swift
//  sports-formula1
//
//  Created by Vurgun on 29.08.2023.
//

import SwiftUI
import Kingfisher

struct RaceDetailScreen: View {
    
    @EnvironmentObject var catalog: Catalog
    var model: RaceCardModel
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            
            VStack {
                Text("Race Detail Screen")
                
                if model.completed {
                    HighlightPlayer(size: .init(width: size.width, height: size.width/2))
                } else {
                    KFImage.url(URL(string: model.imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Text(model.name)
                
                if model.completed {
                    
                    ScrollView(.vertical) {
                        
                        LazyVStack {
                            
                            ForEach(catalog.canadaResults) { result in
                                
                                HStack {
                                    
                                    Text("\(result.position)")
                                    Divider()
                                    Text(result.driver.name)
                                    Spacer()
                                    Text(result.time)
                                }.padding(4)
                                Divider()
                            }
                        }
                    }
                    
                } else {
                    
                    Text("SCHEDULED")
                    Text(model.dateTime)
                    
                }
            }
        }.onAppear {
            
            catalog.loadRaceResults()
        }
    }
}

struct RaceDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailScreen(model: canadaRaceCard)
    }
}
