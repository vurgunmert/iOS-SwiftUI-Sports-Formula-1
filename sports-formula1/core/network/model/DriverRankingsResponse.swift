//
//  DriverRankingsResponse.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

struct DriverRankingsResponse: Codable {
    
    var errors     : [String]
    var results    : Int
    var response   : [DriverRankingItem]
    
    enum CodingKeys: String, CodingKey {
        
        case errors     = "errors"
        case results    = "results"
        case response   = "response"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        errors     = try values.decodeIfPresent([String].self   , forKey: .errors     ) ?? []
        results    = try values.decodeIfPresent(Int.self        , forKey: .results    ) ?? 0
        response   = try values.decodeIfPresent([DriverRankingItem].self , forKey: .response   ) ?? []
        
    }
}

struct DriverRankingItem: Codable {
    
    var position : Int
    var driver   : DriverDto
    var team     : TeamDto
    var points   : Int
    
    enum CodingKeys: String, CodingKey {
        
        case position = "position"
        case driver   = "driver"
        case team     = "team"
        case points   = "points"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        position = try values.decode(Int.self    , forKey: .position )
        driver   = try values.decode(DriverDto.self , forKey: .driver   )
        team     = try values.decode(TeamDto.self   , forKey: .team     )
        points   = try values.decodeIfPresent(Int.self    , forKey: .points   ) ?? 0
        
    }
}
