//
//  ForecastHomeViewModel.swift
//  Bolt.iOSTests
//
//  Created by Joseph Samyn on 12/4/22.
//

import XCTest
@testable import Bolt_iOS

final class ForecastHomeViewModelTests: XCTestCase {
    
    struct MockDailyForecastService: DailyForecastServiceProtocol {
        
        func fetchDailyForecast() async -> DailyForecast {
            let forecast = DailyForecast(city: "Chicago", state: "IL", date: Date.now, temperature: 88, icon: "sun.max", weatherDescription: "Partly Sunny", realFeel: 80)
            return forecast
                
       }
    }
    
    var dfService: DailyForecastServiceProtocol!
    var vm: ForecastHomeViewModel!
    var forecast: DailyForecast!

    override func setUpWithError() throws {
        self.dfService = MockDailyForecastService()
        self.vm = ForecastHomeViewModel(dailyForecastService: dfService)
        self.forecast = DailyForecast(city: "Chicago", state: "IL", date: Date.now, temperature: 88, icon: "sun.max", weatherDescription: "Partly Sunny", realFeel: 80)
        
    }
    
    /**
     Tests the trigger function with loading input/action
     */
    func testLoadingInputAction() {
        
        /* Arrange */
        let exp = XCTestExpectation(description: "Fetch daily forecast..")

        /* Act */
        Task {
            await vm.trigger(ForecastHomeInput.load)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)

        /* Assert */
        XCTAssertNotNil(self.vm.state)
        XCTAssertEqual(self.vm.state.forecast, forecast)
        
    }

}
