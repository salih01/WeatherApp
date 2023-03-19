//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Salih on 18.03.2023.
//

import UIKit

class WeatherView: UIView{
    
    // MARK: -  IBOutlets

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    @IBOutlet weak var InfoCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: -  variable
    
    var currentWeather:CurrentWeather!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainInit()
    }
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        mainInit()
    }
    
    
    private func mainInit(){
        Bundle.main.loadNibNamed("WeatherView", owner: self)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        setupTableView()
        setupHourlyCollectionView()
        setupInfoCollectionView()
    }
    
    private func setupTableView(){
        
    }
    
    private func setupHourlyCollectionView(){
        
    }
    
    private func setupInfoCollectionView(){
        
    }
    
    func refreshData(){
        setupCurrentWeather()
    }
    private func setupCurrentWeather(){
        
        cityNameLabel.text = currentWeather.city
        dateLabel.text     = "Today,\(currentWeather.date.shortDate())"
        tempLabel.text     = "\(currentWeather.currentTemp)"
        weatherLabel.text  = currentWeather.weatherType
    }
    
}
