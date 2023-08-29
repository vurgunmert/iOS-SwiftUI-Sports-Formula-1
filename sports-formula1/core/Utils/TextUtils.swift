//
//  TextUtils.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation

func flag(from country:String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.uppercased().unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return s
}
