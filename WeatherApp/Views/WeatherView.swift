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
    var weeklyWeatherForecastData:[WeeklyWeatherForecast] = []
    var dailyWeatherForecastData:[HourlyForeCast] = []
    var weatherInfoData:[WeatherInfo] = []
    
    
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
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    private func setupHourlyCollectionView(){
        
        hourlyCollectionView.register(UINib(nibName: "ForecastCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cell")
        hourlyCollectionView.dataSource = self
        
        
        
    }
    
    private func setupInfoCollectionView(){
        hourlyCollectionView.register(UINib(nibName: "InfoWeatherCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cell")
        hourlyCollectionView.dataSource = self
       
        
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
extension WeatherView:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weeklyWeatherForecastData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherTableViewCell
        
        cell.generateCell(forecast: weeklyWeatherForecastData[indexPath.row])
        return cell
    }

}

extension WeatherView:UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == hourlyCollectionView {
            return dailyWeatherForecastData.count
        } else {
            return weatherInfoData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == hourlyCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ForecastCollectionViewCell
            cell.generateCell(weather: dailyWeatherForecastData[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! InfoWeatherCollectionViewCell
            cell.generateCell(weatherInfo: weatherInfoData[indexPath.row])
            return cell
            
        }
        
    }
    
}
