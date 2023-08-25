//
//  CompetitionDto.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

struct CompetitionDto: Codable {
    
    var id       : Int?      = nil
    var name     : String?   = nil
    var location : LocationDto? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case id       = "id"
        case name     = "name"
        case location = "location"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id       = try values.decodeIfPresent(Int.self      , forKey: .id       )
        name     = try values.decodeIfPresent(String.self   , forKey: .name     )
        location = try values.decodeIfPresent(LocationDto.self , forKey: .location )
        
    }
}
