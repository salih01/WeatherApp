//
//  InfoWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Salih on 20.03.2023.
//

import UIKit

class InfoWeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var infoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func generateCell(weatherInfo:WeatherInfo){
        
        infoLabel.text                      = weatherInfo.InfoText
        infoLabel.adjustsFontSizeToFitWidth = true
        
        if weatherInfo.image != nil {
            nameLabel.isHidden     = true
            infoImageView.isHidden = false
            infoImageView.image    = weatherInfo.image
        } else {
            nameLabel.isHidden                  = false
            infoImageView.isHidden              = true
            nameLabel.adjustsFontSizeToFitWidth = true
            nameLabel.text = weatherInfo.nameText
        }
    }
    
}
