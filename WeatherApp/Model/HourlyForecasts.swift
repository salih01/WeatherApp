//
//  HourlyForecasts.swift
//  WeatherApp
//
//  Created by Salih on 15.03.2023.
//

import Foundation
import SwiftyJSON
import Alamofire



// MARK: -  Saatlik tahminler

class HourlyForeCast {
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
    
   
    
    class func downloadHourlyForecastWeather(completion: @escaping (_ hourlyForecast: [HourlyForeCast]) -> Void){
        
        let hourlyApi = "https://api.weatherbit.io/v2.0/forecast/minutely?city=Raleigh,NC&key=3e6ec5b90b474a01bf4694f06f7c0f8a&units=I"

        AF.request(hourlyApi).responseJSON { response in
            
            var forecastArray: [HourlyForeCast] = []
            
            switch response.result {
            case .success(let value):
                
                if let dictionary = response.value as? Dictionary<String,AnyObject> {
                    if let list = dictionary["data"] as? [Dictionary<String,AnyObject>] {
                        for item in list {
                                let forecast = HourlyForeCast(weatherDictionary: item)
                                forecastArray.append(forecast)
                        }
                        completion(forecastArray)
                    }
                }

            case .failure(let error):
                print(error)
            

            }
            
        }
    }
    
}
