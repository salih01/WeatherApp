//
//  ViewController.swift
//  WeatherApp
//
//  Created by Salih on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        /*
        HourlyForeCast.downloadHourlyForecastWeather { hourlyForecastArray in
            
            for data in hourlyForecastArray {
                print("forecast data : \(data.date)---\(data.temp)---\(data.weatherIcon)")
            }
         */
        
        
        WeeklyWeatherForecast.downloadWeeklyWeatherForecast { weatherForecast in
            
            for forecast in weatherForecast {
                print(forecast.date)
            }
            
        }
    }


}

