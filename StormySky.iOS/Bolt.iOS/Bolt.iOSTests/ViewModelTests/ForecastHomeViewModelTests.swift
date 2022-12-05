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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /**
     Tests the init method properly initializes the state object
     */
    func testTriggerLoadingInput() throws {
        let vm: ForecastHomeViewModel = ForecastHomeViewModel()
        
        XCTAssertNotNil(vm.state)
    }

}
