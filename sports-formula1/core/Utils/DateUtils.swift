//
//  DateUtils.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import Foundation


private let sportApiDateTimeFormat: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+00:00"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
    return dateFormatter
}()


func dateFrom(date: String) -> Date? {
    sportApiDateTimeFormat.date(from: date)
}
