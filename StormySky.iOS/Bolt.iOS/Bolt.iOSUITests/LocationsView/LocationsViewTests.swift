//
//  LocationsViewTests.swift
//  Bolt.iOSUITests
//
//  Created by Joseph Samyn on 12/10/22.
//

import XCTest
import ViewInspector
@testable import Bolt_iOS

/* Initialize ViewInspector for use with LocationsView */
extension Locations: Inspectable {}

final class LocationsViewTests: XCTestCase {
    
    struct MockUserLocationService: UserLocationServiceProtocol {
        func getUserLocations() async -> [Bolt_iOS.UserLocation] {
            return [
                UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max"),
                UserLocation(id: 2, isSelected: false, city: "Phoenix", state: "AZ", latitude: 1.0, longitude: 1.0, lastTemp: 101, icon: "sun.max"),
                UserLocation(id: 3, isSelected: false, city: "Detroid", state: "MI", latitude: 1.0, longitude: 1.0, lastTemp: 72, icon: "sun.max")
            ]
        }
        
        
    }
    
    /* Properties */
    var locationsService: UserLocationServiceProtocol!
    
    override func setUp()  {
        self.locationsService = MockUserLocationService()
    }
    
    func testLocationsView() {
        let view = Locations(locationsService: self.locationsService)
    }
}
