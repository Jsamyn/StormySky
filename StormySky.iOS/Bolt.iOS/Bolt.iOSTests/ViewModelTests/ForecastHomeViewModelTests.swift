//
//  ForecastHomeViewModel.swift
//  Bolt.iOSTests
//
//  Created by Joseph Samyn on 12/4/22.
//

import XCTest
@testable import Bolt_iOS

final class ForecastHomeViewModelTests: XCTestCase {
    

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /**
     Tests the init method properly initializes the state object
     */
    func testViewModelInitialization() {
        
        let dfService = MockDailyForecastService()
        let vm: ForecastHomeViewModel = ForecastHomeViewModel(dailyForecastService: dfService)
        
        XCTAssertNotNil(vm.state)
    }
    
    /**
     Tests the trigger function with loading input/action
     */
    func testLoadingInputAction() async {
        /* Arrange */
        let dfService = MockDailyForecastService()
        let vm: ForecastHomeViewModel = ForecastHomeViewModel(dailyForecastService: dfService)
        let forecast = DailyForecast(city: "Chicago", state: "IL", date: Date.now, temperature: 88, icon: "sun.max", weatherDescription: "Partly Sunny", realFeel: 80)
        
        /* Act */
        await vm.trigger(ForecastHomeInput.load)
        
        /* Assert */
        XCTAssertNotNil(vm.state)
        XCTAssertEqual(vm.state.forecast, forecast)
        
    }

}
