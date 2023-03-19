//
//  Date.swift
//  WeatherApp
//
//  Created by Salih on 19.03.2023.
//

import Foundation


extension Date {
    
    func shortDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: self)
    }
    
    func time() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
        
    }
}
