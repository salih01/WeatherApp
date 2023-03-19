//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Salih on 17.03.2023.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // WeatherView sınıfından bir obje oluşturduk
       
        let weatherView = WeatherView()
        weatherView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.addSubview(weatherView)
        
        weatherView.currentWeather = CurrentWeather()
        weatherView.currentWeather.getCurrentWeather { success in
            
            weatherView.refreshData()
            
        }
         
       
    }
    
}
