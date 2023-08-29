//
//  LocationDto.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation


struct LocationDto: Codable {
    
    var country : String? = nil
    var city    : String? = nil
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case city    = "city"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        country = try values.decodeIfPresent(String.self , forKey: .country )
        city    = try values.decodeIfPresent(String.self , forKey: .city    )
    }
    
    init(country: String? = nil, city: String? = nil) {
        self.country = country
        self.city = city
    }
    
}
