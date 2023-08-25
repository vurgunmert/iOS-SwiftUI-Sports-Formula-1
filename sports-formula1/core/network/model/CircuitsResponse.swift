//
//  CircuitsResponse.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

struct CircuitsResponse: Codable {
    
    var errors     : [String]
    var results    : Int
    var response   : [CircuitsResponseItem]
    
    enum CodingKeys: String, CodingKey {
        
        case errors     = "errors"
        case results    = "results"
        case response   = "response"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        errors     = try values.decodeIfPresent([String].self   , forKey: .errors     ) ?? []
        results    = try values.decodeIfPresent(Int.self        , forKey: .results    ) ?? 0
        response   = try values.decodeIfPresent([CircuitsResponseItem].self , forKey: .response   ) ?? []
        
    }
}


struct CircuitsResponseItem: Codable {
    
    var id             : Int?         = nil
    var name           : String?      = nil
    var image          : String?      = nil
    var competition    : CompetitionDto? = nil
    var firstGrandPrix : Int?         = nil
    var laps           : Int?         = nil
    var length         : String?      = nil
    var raceDistance   : String?      = nil
    var lapRecord      : LapRecordDto?   = nil
    var capacity       : Int?         = nil
    var opened         : Int?         = nil
    var owner          : String?      = nil
    
    enum CodingKeys: String, CodingKey {
        
        case id             = "id"
        case name           = "name"
        case image          = "image"
        case competition    = "competition"
        case firstGrandPrix = "first_grand_prix"
        case laps           = "laps"
        case length         = "length"
        case raceDistance   = "race_distance"
        case lapRecord      = "lap_record"
        case capacity       = "capacity"
        case opened         = "opened"
        case owner          = "owner"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id             = try values.decodeIfPresent(Int.self         , forKey: .id             )
        name           = try values.decodeIfPresent(String.self      , forKey: .name           )
        image          = try values.decodeIfPresent(String.self      , forKey: .image          )
        competition    = try values.decodeIfPresent(CompetitionDto.self , forKey: .competition    )
        firstGrandPrix = try values.decodeIfPresent(Int.self         , forKey: .firstGrandPrix )
        laps           = try values.decodeIfPresent(Int.self         , forKey: .laps           )
        length         = try values.decodeIfPresent(String.self      , forKey: .length         )
        raceDistance   = try values.decodeIfPresent(String.self      , forKey: .raceDistance   )
        lapRecord      = try values.decodeIfPresent(LapRecordDto.self   , forKey: .lapRecord      )
        capacity       = try values.decodeIfPresent(Int.self         , forKey: .capacity       )
        opened         = try values.decodeIfPresent(Int.self         , forKey: .opened         )
        owner          = try values.decodeIfPresent(String.self      , forKey: .owner          )
        
    }
    
    init() {
        
    }
    
}
