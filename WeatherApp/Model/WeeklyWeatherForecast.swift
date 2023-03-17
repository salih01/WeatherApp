//
//  WeeklyWeatherForecast.swift
//  WeatherApp
//
//  Created by Salih on 16.03.2023.
//

import Foundation
import Alamofire
import SwiftyJSON


class WeeklyWeatherForecast {
    
    private var _date :Date!
    private var _temp:Double!
    private var _weatherIcon:String!
     
     var date:Date {
         if _date == nil {
             _date = Date()
         }
         return _date
     }
     
     var temp:Double {
         if _temp == nil {
             _temp = 0
         }
         return _temp
     }
     
     
     var weatherIcon:String {
         if _weatherIcon == nil {
             _weatherIcon = ""
         }
         return _weatherIcon
     }
     
     
     init(weatherDictionary:Dictionary<String,AnyObject>){
         
         let json = JSON(weatherDictionary)
         self._temp = json["temp"].double
         self._date = currentDateFromUnix(unixDate: json["ts"].double)
         self._weatherIcon = json["weather"]["icon"].stringValue
         
     }
    
    
    
    class func downloadWeeklyWeatherForecast(completion: @escaping (_ weatherForecast:[WeeklyWeatherForecast])-> Void) {
        
        let weeklyApi = "https://api.weatherbit.io/v2.0/forecast/daily?city=Nicosia,CY&days=7&key=3e6ec5b90b474a01bf4694f06f7c0f8a&units=I"
        
        AF.request(weeklyApi).responseJSON { response in
            
            var forecastArray: [WeeklyWeatherForecast] = []
            
            let result = response.result
            
            switch result {
                
            case .success(let value):
                    
            
                if let dictionary = response.value as? Dictionary<String,AnyObject> {
                    if var list = dictionary["data"] as? [Dictionary<String,AnyObject>] {
                        
                        list.remove(at: 0) // ilk günü silelim . o günü zaten gösteriyoruz Önemli olan ondan sonraki günler
                        
                        print("number of days: \(list.count)")
                        
                        for item in list {
                            let forecast = WeeklyWeatherForecast(weatherDictionary: item)
                            forecastArray.append(forecast)

                        }
                    }
                }
                
                
                completion(forecastArray)
                
            case .failure(let error):
                print(error)
            }
            
            
            
        }
        
    }
    
}
