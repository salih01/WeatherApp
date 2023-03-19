//
//  ForecastCollectionViewCell.swift
//  WeatherApp
//
//  Created by Salih on 19.03.2023.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func generateCell(weather:HourlyForeCast) {
        
        // date den gelen verinin sadece saat kısmını labeldan göstermek istiyoruz bu yüzden Extensions Date class ımıza yeni bir fonksiyon yazdık . Bu fonksiyon yalnızca saati döndürecek
        
        timeLabel.text             = weather.date.time()
        tempLabel.text             = "\(weather.temp)"
        weatherIconImageView.image = getWeatherIconFor(weather.weatherIcon)
        
    }

}
