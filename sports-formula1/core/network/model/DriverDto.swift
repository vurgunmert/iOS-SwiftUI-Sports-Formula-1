//
//  DriverDto.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation


struct DriverDto: Codable {
    
    var id     : Int
    var name   : String
    var abbr   : String? = nil
    var number : Int
    var image  : String
    
    enum CodingKeys: String, CodingKey {
        
        case id     = "id"
        case name   = "name"
        case abbr   = "abbr"
        case number = "number"
        case image  = "image"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id     = try values.decode(Int.self    , forKey: .id     )
        name   = try values.decode(String.self , forKey: .name   )
        abbr   = try values.decodeIfPresent(String.self , forKey: .abbr   )
        number = try values.decode(Int.self    , forKey: .number )
        image  = try values.decode(String.self , forKey: .image  )
        
    }
}



struct DriverIdDto: Codable {
    
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case id  = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id     = try values.decodeIfPresent(Int.self, forKey: .id)
    }
}

