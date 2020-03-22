//
//  LocationFile.swift
//  Weather Gift
//
//  Created by Kathryn Tatum on 3/10/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import Foundation

//use a class to create an object
class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
