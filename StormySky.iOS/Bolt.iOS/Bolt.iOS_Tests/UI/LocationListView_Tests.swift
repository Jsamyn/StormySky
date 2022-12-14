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
extension LocationCell: Inspectable {}

final class LocationsListView_Tests: XCTestCase {
    
    var sub: LocationsList!
    
    override func setUp() {
        
        let locations = [
            UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max"),
            UserLocation(id: 2, isSelected: false, city: "Phoenix", state: "AZ", latitude: 1.0, longitude: 1.0, lastTemp: 101, icon: "sun.max"),
            UserLocation(id: 3, isSelected: false, city: "Detroid", state: "MI", latitude: 1.0, longitude: 1.0, lastTemp: 72, icon: "sun.max")
            
        ]
        
        self.sub = LocationsList(locations: locations)
    }
    
    /**
     Validate the list shows properly on screen
     */
    func testListPresent() throws {
        /* Arrange */
        let cellCountExp = 3
        
        /* Act */
        let cells = try self.sub.inspect().findAll(LocationCell.self)
        
        /* Assert */
        XCTAssertEqual(cells.count, cellCountExp)
    }

}
