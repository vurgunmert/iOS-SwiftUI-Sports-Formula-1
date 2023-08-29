//
//  LapRecordDto.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation


struct LapRecordDto: Codable {
    
    var time   : String? = nil
    var driver : String? = nil
    var year   : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case time   = "time"
        case driver = "driver"
        case year   = "year"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        time   = try values.decodeIfPresent(String.self , forKey: .time   )
        driver = try values.decodeIfPresent(String.self , forKey: .driver )
        year   = try values.decodeIfPresent(String.self , forKey: .year   )
        
    }
    
    init() {
        
    }
    
}
