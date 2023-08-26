//
//  RacesResponse.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

struct RacesResponse: Codable {
    
    var errors     : [String]
    var results    : Int
    var response   : [RacesResponseItem]
    
    enum CodingKeys: String, CodingKey {
        
        case errors     = "errors"
        case results    = "results"
        case response   = "response"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        errors     = try values.decodeIfPresent([String].self   , forKey: .errors     ) ?? []
        results    = try values.decodeIfPresent(Int.self        , forKey: .results    ) ?? 0
        response   = try values.decodeIfPresent([RacesResponseItem].self , forKey: .response   ) ?? []
    }
    
    init(items: [RacesResponseItem]) {
        errors = []
        results = items.count
        response = items
    }
}

struct RacesResponseItem: Codable {
    
    var id          : Int
    var competition : CompetitionDto? = nil
    var circuit     : CircuitDto?     = nil
    var season      : Int?         = nil
    var type        : String?      = nil
    var laps        : LapsDto?        = nil
    var fastestLap  : FastestLapDto?  = nil
    var distance    : String?      = nil
    var timezone    : String?      = nil
    var date        : String?      = nil
    var weather     : String?      = nil
    var status      : String?      = nil
    
    enum CodingKeys: String, CodingKey {
        
        case id          = "id"
        case competition = "competition"
        case circuit     = "circuit"
        case season      = "season"
        case type        = "type"
        case laps        = "laps"
        case fastestLap  = "fastest_lap"
        case distance    = "distance"
        case timezone    = "timezone"
        case date        = "date"
        case weather     = "weather"
        case status      = "status"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id          = try values.decode(Int.self         , forKey: .id          )
        competition = try values.decodeIfPresent(CompetitionDto.self , forKey: .competition )
        circuit     = try values.decodeIfPresent(CircuitDto.self     , forKey: .circuit     )
        season      = try values.decodeIfPresent(Int.self         , forKey: .season      )
        type        = try values.decodeIfPresent(String.self      , forKey: .type        )
        laps        = try values.decodeIfPresent(LapsDto.self        , forKey: .laps        )
        fastestLap  = try values.decodeIfPresent(FastestLapDto.self  , forKey: .fastestLap  )
        distance    = try values.decodeIfPresent(String.self      , forKey: .distance    )
        timezone    = try values.decodeIfPresent(String.self      , forKey: .timezone    )
        date        = try values.decodeIfPresent(String.self      , forKey: .date        )
        weather     = try values.decodeIfPresent(String.self      , forKey: .weather     )
        status      = try values.decodeIfPresent(String.self      , forKey: .status      )
    }
    
    init(id: Int,
         competition: CompetitionDto? = nil,
         circuit: CircuitDto? = nil,
         season: Int? = nil,
         type: String? = nil,
         laps: LapsDto? = nil,
         fastestLap: FastestLapDto? = nil,
         distance: String? = nil,
         timezone: String? = nil,
         date: String? = nil,
         weather: String? = nil,
         status: String? = nil) {
        
        self.id = id
        self.competition = competition
        self.circuit = circuit
        self.season = season
        self.type = type
        self.laps = laps
        self.fastestLap = fastestLap
        self.distance = distance
        self.timezone = timezone
        self.date = date
        self.weather = weather
        self.status = status
    }
}
