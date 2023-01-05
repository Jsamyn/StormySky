//
//  LocationsViewModelTests.swift
//  Bolt.iOSTests
//
//  Created by Joseph Samyn on 12/9/22.
//

import XCTest
@testable import Bolt_iOS

final class LocationsViewModelTests: XCTestCase {
    
    struct MockUserLocationService: UserLocationServiceProtocol {
        func getUserLocations() async -> [Bolt_iOS.UserLocation] {
            return [
                UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max"),
                UserLocation(id: 2, isSelected: false, city: "Phoenix", state: "AZ", latitude: 1.0, longitude: 1.0, lastTemp: 101, icon: "sun.max"),
                UserLocation(id: 3, isSelected: false, city: "Detroid", state: "MI", latitude: 1.0, longitude: 1.0, lastTemp: 72, icon: "sun.max")
            ]
        }
        
        
    }
    
    var locationService: UserLocationServiceProtocol!
    var vm: LocationsViewModel!
    
    
    override func setUpWithError() throws {
        self.locationService = MockUserLocationService()
        self.vm = LocationsViewModel(locationService: self.locationService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    /// Test the initialization of state struct
    func testInitialization() {
        /* Arrange */
        
        /* Act */
        let result = vm.state
        
        /* Assert */
        XCTAssertNotNil(result)
        XCTAssertEqual(result.locations.count, 0)
    }
    

    /// Test the loading input on the trigger method
    func testTriggerLoadingState() {
        
        /* Arrange */
        let exp = expectation(description: "Fetch user locations")
        
        /* Act */
        Task {
            await self.vm.loadLocations()
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
        let result = self.vm.state
        
        /* Assert */
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.locations)
        XCTAssertEqual(result.locations.count, 3)
    }
    

    /// Validate clicking plus button toggles AddLocationModal on and off
    func testToggleAddLocationModal() {
        
        /* Arrange */
        
        /* Act */
        let initial = self.vm.state.addLocationsVisible
        self.vm.toggleAddLocationModal()
        let res = self.vm.state.addLocationsVisible
        
        /* Assert */
        XCTAssertFalse(initial)
        XCTAssertTrue(res)
        
    }
    

    /// Validate the proper error message is displayed when zip code not matching valid criteria is submitted
    func testAddInvalidZipCodeLength() {
        /* Arrange */
        vm.state.locationsText = "123"
        let errorText = vm.zipCodeImproperLength
        
        /* Act */
        vm.addLocation()
        
        /* Assert */
        XCTAssertEqual(errorText, vm.state.locationsErrorText)
    }
    
    /// Validate no error message is set when a valid zip code is entered
    func testAddValidZipCodeNoErrorMessage() {
        // Arrange
        vm.state.locationsText = "12345"
        
        // Act
        vm.addLocation()
        
        // Assert
        XCTAssertTrue(vm.state.locationsErrorText.isEmpty)
    }

}
