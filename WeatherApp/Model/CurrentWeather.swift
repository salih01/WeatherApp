//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Salih on 15.03.2023.
//

import Foundation
import Alamofire
import SwiftyJSON



class CurrentWeather {
    
    private var _city:String!
    private var _date:Date!
    private var _currentTemp:Double!
    private var _feelsLike:Double!
    private var _uv:Double!
    
    private var _weatherType:String!
    private var _pressure:Double!
    private var _humidity:Double!
    private var _windSpeed:Double!
    private var _weatherIcon:String!
    private var _visibility:Double!
    private var _sunrise:String!
    private var _sunset:String!
    
    var city:String {
        if _city == nil{
            _city = ""
        }
        return _city
    }
    var date: Date {
        if _date == nil {
            _date = Date()
        }
        return _date
    }
    var uv: Double {
        if _uv == nil {
            _uv = 0.0
        }
        return _uv
    }
    var sunrise: String {
        if _sunrise == nil {
            _sunrise = ""
        }
        return _sunrise
    }
    var sunset: String {
        if _sunset == nil {
            _sunset = ""
        }
        return _sunset
    }
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    var feelsLike: Double {
        if _feelsLike == nil {
            _feelsLike = 0.0
        }
        return _feelsLike
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var pressure: Double {
        if _pressure == nil {
            _pressure = 0.0
        }
        return _pressure
    }
    var humidity: Double {
        if _humidity == nil {
            _humidity = 0.0
        }
        return _humidity
    }
    var windSpeed: Double {
        if _windSpeed == nil {
            _windSpeed = 0.0
        }
        return _windSpeed
    }
    var weatherIcon: String {
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    var visibility: Double {
        if _visibility == nil {
            _visibility = 0.0
        }
        return _visibility
    }


    
    

    
    func getCurrentWeather(completion: @escaping(_ success: Bool) -> Void) {
        
        let currentApi = "https://api.weatherbit.io/v2.0/current?lat=35.7796&lon=-78.6382&key=3e6ec5b90b474a01bf4694f06f7c0f8a&include=minutely"
        let request = AF.request(currentApi)
        
        request.responseJSON { data in
            
            do {
                let json = try JSON(data.value)
                
                self._date        = currentDateFromUnix(unixDate: json["data"][0]["ts"].double)
                self._city        = json["data"][0]["timezone"].stringValue
                self._weatherType = json["data"][0]["weather"]["description"].stringValue
                self._currentTemp = json["data"][0]["temp"].double
                self._feelsLike   = json["data"][0]["app_temp"].double
                self._pressure    = json["data"][0]["pres"].double
                self._humidity    = json["data"][0]["rh"].double
                self._windSpeed   = json["data"][0]["wind_spd"].double
                self._weatherIcon = json["data"][0]["weather"]["icon"].string
                self._visibility  = json["data"][0]["vis"].double
                self._uv          = json["data"][0]["uv"].double
                self._sunrise     = json["data"][0]["sunrise"].string
                self._sunset      = json["data"][0]["sunset"].string
                print(self.windSpeed)
                completion(true)
                

            } catch {
                print("Errorrrrrrr JSON :\(error.localizedDescription)")
                completion(false)
                
            }
            
        }
  
    }
    
}
