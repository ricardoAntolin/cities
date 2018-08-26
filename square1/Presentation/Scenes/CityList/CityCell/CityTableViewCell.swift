//
//  CityTableViewCell.swift
//  square1
//
//  Created by Ricardo Antolin on 26/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bindData(city: UICity){
        lblCityName.text = city.name
        lblCountryName.text = city.country?.name
        lblLatitude.text = String(city.lat)
        lblLongitude.text = String(city.lng)
    }
    
}
