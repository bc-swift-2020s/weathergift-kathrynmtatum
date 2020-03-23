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
    
    func getData() {
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIkeys.darkSkyKey)/\(coordinates)"
        print("🛫 We are accessing the URL \(urlString)")
        
        //Create URL
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create URL from \(urlString)")
            return
        }
        
        //Create Session
        let session = URLSession.shared
        
        //Get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("😎 \(json)")
            } catch {
                print("🥵 JSON ERROR: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
