//
//  DailyForecastService.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/29/22.
//

import Foundation
import Combine

enum ServiceError: Error {
    case jsonDecodeError
    case serviceUnavailable
    case unauthorized
    case notFound
}

protocol DailyForecastServiceProtocol {
    
    /**
     Get daily forecast for currently selected region
     */
    func fetchDailyForecast() async -> DailyForecast
}


class DailyForecastService: DailyForecastServiceProtocol {
    
    func fetchDailyForecast() async -> DailyForecast {
        let forecast = DailyForecast(city: "Chicago", state: "IL", date: Date.now, temperature: 88, icon: "sun.max", weatherDescription: "Partly Sunny", realFeel: 80)
        return forecast
   }
}
    
