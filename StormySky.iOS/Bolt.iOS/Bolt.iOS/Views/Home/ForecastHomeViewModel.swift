//
//  ForecastHomeViewModel.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/24/22.
//

import Foundation
import Combine

struct ForecastHomeState {
    var forecast: DailyForecast = DailyForecast()
    var isLoading: Bool = false
}

enum ForecastHomeInput {
    case load
}

class ForecastHomeViewModel: ViewModel {
    
    /* Published Variables */
    @Published
    var state: ForecastHomeState
    
    /* Private Variables */
    private var forecastServiceCancellable: AnyCancellable?
    private let forecastService = DailyForecastService()
    
    /* Constructor */
    init() {
        self.state = ForecastHomeState()
    }
 
    func trigger(_ input: ForecastHomeInput) {
        switch input {
            /* Page Load Action */
            case .load:
            Task {
                await loadDailyForecast()
            }
        }
    }
    
    /* Private Methods */
    @MainActor private func loadDailyForecast() async {
        state.isLoading = true
        self.state.forecast = await self.forecastService.fetchDailyForecast()
        state.isLoading = false
    }
    
}
