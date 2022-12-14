//
//  LocationsListView_Tests.swift
//  Bolt.iOS_UITests
//
//  Created by Joseph Samyn on 12/13/22.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Bolt_iOS


extension LocationsList: Inspectable {}

final class LocationsListView_Tests: XCTestCase {

    
    /**
     Validate the list shows properly on screen
     */
    func testListPresent() throws {
        /* Arrange */
        let locations = [
            UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max"),
            UserLocation(id: 2, isSelected: false, city: "Phoenix", state: "AZ", latitude: 1.0, longitude: 1.0, lastTemp: 101, icon: "sun.max"),
            UserLocation(id: 3, isSelected: false, city: "Detroid", state: "MI", latitude: 1.0, longitude: 1.0, lastTemp: 72, icon: "sun.max")
            
        ]
        
        var sub: LocationsList = LocationsList(locations: locations)
        
        /* Act */
        let exp = sub.inspection.inspect { view in
            XCTAssertNotNil(view)
        }
        
        /* Assert */
    }

}
