//
//  Post.swift
//  sports-formula1
//
//  Created by user on 27.08.2023.
//

import Foundation

protocol CarouselItem: Identifiable, Equatable {
    
}

struct Post: CarouselItem {
    var id: UUID = .init()
    var image: String
    var title: String
}
