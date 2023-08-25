//
//  CircuitDto.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

struct CircuitDto: Codable {
    
    var id    : Int?    = nil
    var name  : String? = nil
    var image : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case id    = "id"
        case name  = "name"
        case image = "image"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id    = try values.decodeIfPresent(Int.self    , forKey: .id    )
        name  = try values.decodeIfPresent(String.self , forKey: .name  )
        image = try values.decodeIfPresent(String.self , forKey: .image )
        
    }
    
    init() {
        
    }
    
}
