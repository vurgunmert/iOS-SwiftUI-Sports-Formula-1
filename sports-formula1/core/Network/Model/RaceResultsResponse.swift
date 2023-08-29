//
//  RaceResultsResponse.swift
//  sports-formula1
//
//  Created by Vurgun on 29.08.2023.
//

import Foundation

struct RaceResultsResponse: Codable {
    
    var errors     : [String]
    var results    : Int
    var response   : [RaceResultItem]
    
    enum CodingKeys: String, CodingKey {
        
        case errors     = "errors"
        case results    = "results"
        case response   = "response"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        errors     = try values.decodeIfPresent([String].self   , forKey: .errors     ) ?? []
        results    = try values.decodeIfPresent(Int.self        , forKey: .results    ) ?? 0
        response   = try values.decodeIfPresent([RaceResultItem].self , forKey: .response   ) ?? []
    }
    
    init(items: [RaceResultItem]) {
        errors = []
        results = items.count
        response = items
    }
}

struct RaceResultItem: Codable {
    
    var position: Int
    var time: String
    var driver: DriverDto
    var team: TeamDto
    
    enum CodingKeys: String, CodingKey {
        
        case position          = "position"
        case time = "time"
        case driver     = "driver"
        case team      = "team"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        position          = try values.decode(Int.self, forKey: .position)
        time          = try values.decode(String.self, forKey: .time)
        driver          = try values.decode(DriverDto.self, forKey: .driver)
        team          = try values.decode(TeamDto.self, forKey: .team)
    }

}
