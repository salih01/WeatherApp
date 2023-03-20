//
//  GlobalHelpers.swift
//  WeatherApp
//
//  Created by Salih on 15.03.2023.
//

import Foundation
import UIKit


func currentDateFromUnix(unixDate:Double?) -> Date? {
    
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    } else {
        return Date()
    }
}
// Stringten image e dönüştürmemizi sağlayan extension
func getWeatherIconFor(_ type:String) -> UIImage? {
    return UIImage(named: type)
}
