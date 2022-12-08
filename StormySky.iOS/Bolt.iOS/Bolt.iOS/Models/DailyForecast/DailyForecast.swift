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
    var city: String
    
    /**
     State the city resides
     */
    var state: String
    
    /**
     Full date of forecast fetch
     */
    var date: Date
    
    /**
     Current Temperature
     */
    var temperature: Int
    
    /**
     Icon associated to current forecast
     */
    var icon: String
    
    /**
     Description of current weather forecast
     */
    var weatherDescription: String
    
    /**
     Real feel temperature
     */
    var realFeel: Int 
    
}


extension DailyForecast: Equatable {
    /**
     Compare two DailyForecast objects for equality
     
     - Parameters:
        - lsh: first object to use for equality compare
        - rhs: second object to use for equality compare
     - Returns: true if both objects are equal
     */
    static func == (lhs: DailyForecast, rhs: DailyForecast) -> Bool {
        return lhs.city == rhs.city
        && lhs.state == rhs.state
        && lhs.temperature == rhs.temperature
        && lhs.icon == rhs.icon
        && lhs.weatherDescription == rhs.weatherDescription
        && lhs.realFeel == rhs.realFeel
    }
}
