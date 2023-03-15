//
//  GlobalHelpers.swift
//  WeatherApp
//
//  Created by Salih on 15.03.2023.
//

import Foundation


func currentDateFromUnix(unixDate:Double?) -> Date? {
    
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    } else {
        return Date()
    }
    
}
