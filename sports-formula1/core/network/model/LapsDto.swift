//
//  LapsDto.swift
//  sports-formula1
//
//  Created by user on 25.08.2023.
//

import Foundation
    
struct LapsDto: Codable {
    
    var current : String? = nil
    var total   : Int?    = nil
    
    enum CodingKeys: String, CodingKey {
        
        case current = "current"
        case total   = "total"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        current = try values.decodeIfPresent(String.self , forKey: .current )
        total   = try values.decodeIfPresent(Int.self    , forKey: .total   )
        
    }
    
    init() {
        
    }
    
}


struct FastestLapDto: Codable {
    
    var driver : DriverIdDto? = nil
    var time   : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case driver = "driver"
        case time   = "time"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        driver = try values.decodeIfPresent(DriverIdDto.self , forKey: .driver )
        time   = try values.decodeIfPresent(String.self , forKey: .time   )
        
    }
    
    init() {
        
    }
    
}
