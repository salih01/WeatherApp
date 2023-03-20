//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Salih on 20.03.2023.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func generateCell(forecast:WeeklyWeatherForecast){
        
        dayOfTheWeekLabel.text     = forecast.date.dayOfTheWeek()
        weatherIconImageView.image = getWeatherIconFor(forecast.weatherIcon)
        tempLabel.text             = "\(forecast.temp)"
        
    }
    
}
