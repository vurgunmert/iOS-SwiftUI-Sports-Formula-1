//
//  Team.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

struct TeamDto: Codable {
    
    var id   : Int
    var name : String
    var logo : String
    
    enum CodingKeys: String, CodingKey {
        
        case id   = "id"
        case name = "name"
        case logo = "logo"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id   = try values.decode(Int.self    , forKey: .id   )
        name = try values.decode(String.self , forKey: .name )
        logo = try values.decode(String.self , forKey: .logo )
        
    }
}
