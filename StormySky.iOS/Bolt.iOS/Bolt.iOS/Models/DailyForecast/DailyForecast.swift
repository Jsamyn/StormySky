//
//  DailyForecast.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/29/22.
//

import Foundation

struct DailyForecast {
    
    /**
     City the forecase is for
     */
    var city: String = ""
    
    /**
     State the city resides
     */
    var state: String = ""
    
    /**
     Full date of forecast fetch
     */
    var date: Date = Date.now
    
    /**
     Current Temperature
     */
    var temperature: Int = 0
    
    /**
     Icon associated to current forecast
     */
    var icon: String = ""
    
    /**
     Description of current weather forecast
     */
    var weatherDescription: String = ""
    
    /**
     Real feel temperature
     */
    var realFeel: Int = 0
    
}
