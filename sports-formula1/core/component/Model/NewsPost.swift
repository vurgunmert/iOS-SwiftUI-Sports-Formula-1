//
//  Post.swift
//  sports-formula1
//
//  Created by Vurgun on 27.08.2023.
//

import Foundation

protocol CarouselItem: Identifiable, Equatable {
    var id: UUID { get }
    var image: String { get set }
    var title: String? { get set }
}

struct NewsPost: CarouselItem {
    var id: UUID = .init()
    var image: String
    var title: String?
    var memo: String?
}
