//
//  ForecastHomeViewModel.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/24/22.
//

import Foundation
import Combine

struct ForecastHomeState {
    
    init() {
        print("Initializing...")
    }
    
    var forecast: DailyForecast = DailyForecast(city: "", state: "", date: Date.now, temperature: 0, icon: "sun.max", weatherDescription: "", realFeel: 0)
    var isLoading: Bool = false
}

enum ForecastHomeInput {
    case load
}

class ForecastHomeViewModel: ViewModel {
    
    /* Published Variables */
    @Published var state: ForecastHomeState = ForecastHomeState()
    
    /* Private Variables */
    private let forecastService: DailyForecastServiceProtocol
    
    /* Constructor */
    init(dailyForecastService: DailyForecastServiceProtocol) {
        self.forecastService = dailyForecastService
    }
 
    func trigger(_ input: ForecastHomeInput) async {
        switch input {
            /* Page Load Action */
            case .load:
                await loadDailyForecast()
        }
    }
    
    /* Private Methods */
    @MainActor private func loadDailyForecast() async -> Void {
        state.isLoading = true
        self.state.forecast = await self.forecastService.fetchDailyForecast()
        print("fetching forecast..")
        state.isLoading = false
    }
    
}
