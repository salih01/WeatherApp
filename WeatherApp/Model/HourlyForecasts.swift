//
//  HourlyForecasts.swift
//  WeatherApp
//
//  Created by Salih on 15.03.2023.
//

import Foundation
import Alamofire
import SwiftyJSON


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
    
    
    func downloadDailyForecastWeather(){
        
        let dailyApi = "https://api.weatherbit.io/v2.0/forecast/minutely?city=Raleigh,NC&key=3e6ec5b90b474a01bf4694f06f7c0f8a&units=I"
    
        let request = AF.request(dailyApi)
        request.responseJSON { response in
            
            do {
                //let json = try JSON(response)
                let result = response.result
               // guard let daily = response.value else {return}

                print("Veri:\(result)")

            }catch {
                print(error.localizedDescription)
            }
            
            
        }
        
    }
    
}
