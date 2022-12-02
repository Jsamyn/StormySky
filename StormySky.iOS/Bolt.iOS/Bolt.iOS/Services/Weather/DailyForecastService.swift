//
//  DailyForecastService.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/29/22.
//

import Foundation
import Combine

protocol DailyForecastServiceProtocol {
    
    /**
     Get daily forecase for currently selected region
     */
    func fetchDailyForecast() async -> DailyForecast
}


class DailyForecastService: DailyForecastServiceProtocol {
    
    func fetchDailyForecast() async -> DailyForecast {
        Thread.sleep(forTimeInterval: 2)
        let forecast = DailyForecast(city: "Chicago", state: "IL", date: Date.now, temperature: 88, icon: "sun.max", weatherDescription: "Partly Sunny", realFeel: 80)
        return forecast
            
   }
}
    
