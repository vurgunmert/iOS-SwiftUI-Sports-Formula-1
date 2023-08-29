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
    
    init(items: [CircuitsResponseItem]) {
        self.errors = []
        self.results = items.count
        self.response = items
    }
}


struct CircuitsResponseItem: Codable {
    
    var id             : Int
    var name           : String
    var image          : String
    var competition    : CompetitionDto
    var firstGrandPrix : Int
    var laps           : Int
    var length         : String
    var raceDistance   : String
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
        
        id             = try values.decode(Int.self         , forKey: .id             )
        name           = try values.decode(String.self      , forKey: .name           )
        image          = try values.decode(String.self      , forKey: .image          )
        competition    = try values.decode(CompetitionDto.self , forKey: .competition    )
        firstGrandPrix = try values.decode(Int.self         , forKey: .firstGrandPrix )
        laps           = try values.decode(Int.self         , forKey: .laps           )
        length         = try values.decode(String.self      , forKey: .length         )
        raceDistance   = try values.decode(String.self      , forKey: .raceDistance   )
        lapRecord      = try values.decodeIfPresent(LapRecordDto.self   , forKey: .lapRecord      )
        capacity       = try values.decodeIfPresent(Int.self         , forKey: .capacity       )
        opened         = try values.decodeIfPresent(Int.self         , forKey: .opened         )
        owner          = try values.decodeIfPresent(String.self      , forKey: .owner          )
    }
    
    init(id: Int,
         name: String,
         image: String,
         competition: CompetitionDto,
         firstGrandPrix: Int,
         laps: Int,
         length: String,
         raceDistance: String,
         lapRecord: LapRecordDto? = nil,
         capacity: Int? = nil,
         opened: Int? = nil,
         owner: String? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.competition = competition
        self.firstGrandPrix = firstGrandPrix
        self.laps = laps
        self.length = length
        self.raceDistance = raceDistance
        self.lapRecord = lapRecord
        self.capacity = capacity
        self.opened = opened
        self.owner = owner
    }
    
}
