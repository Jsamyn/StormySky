//
//  LocationsViewTests.swift
//  Bolt.iOS_UITests
//
//  Created by Joseph Samyn on 12/11/22.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Bolt_iOS

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
    var sub: Locations!

    override func setUpWithError() throws {
        self.locationsService = MockUserLocationService()
        sub = Locations(locationsService: self.locationsService)
    }

    /**
     Test all necessary elements are present in the view
     */
    func testLocationViewElementsPresent() throws {
        /* Arrange */
        let subject = Locations(locationsService: self.locationsService)

        /* Act */
        let titleResult = try subject.inspect().find(viewWithAccessibilityIdentifier: "locations_title").text().string()
        let locationListResult = try subject.inspect().find(viewWithAccessibilityIdentifier: "locations_list")
        let addButtonResult = try subject.inspect().find(viewWithAccessibilityIdentifier: "add_button")
        let addButtonImageResult = try addButtonResult.find(ViewType.Image.self).actualImage()

        /* Assert */
        XCTAssertNotNil(titleResult)
        XCTAssertNotNil(addButtonResult)
        XCTAssertNotNil(addButtonImageResult)
        XCTAssertNotNil(locationListResult)
    }
    
    /**
     Validate title test is correct
     */
    func testTitleText() throws {
        
        /* Arrange */
        let exp = "Locations"
        
        /* Act */
        let result = try self.sub.inspect().find(viewWithAccessibilityIdentifier: "locations_title").text().string()
        
        /* Assert */
        XCTAssertEqual(result, exp)
        
    }
    
    /**
     Validate button content is correct
     */
    func testAddButtonContent() throws {
        
        /* Arrange */
        let imgExp = Image(systemName: "plus")
        let bgColorExp = Color("PrimaryDark")
        
        /* Act */
        let button = try self.sub.inspect().find(viewWithAccessibilityIdentifier: "add_button")
        let imgRes = try button.find(ViewType.Image.self).actualImage()
        let bgColorRes = try button.background().color().value()
        
        /* Assert */
        XCTAssertNotNil(button)
        XCTAssertEqual(imgRes, imgExp)
        XCTAssertEqual(bgColorRes, bgColorExp)
    }
    
    /**
     Validate Add Button functionality
     */
    func testAddButtonTap() throws {
        
        /* Arrange */
        let button = try self.sub.inspect().find(viewWithAccessibilityIdentifier: "add_button").button()
        
        /* Act */
        try button.tap()
        
        /* Assert */
        XCTAssertNotNil(button)
    }
    
    /**
     Validate AddLocationModal appears properly when clicking '+' button
     */
    func testAddLocationModal() throws {
        // Arrange
        
        // Act
        try sub.inspect().find(viewWithAccessibilityIdentifier: "add_button").button().tap()
        let locTextEdit = try sub.inspect().find(viewWithAccessibilityIdentifier: "Location_Text_Field")
        let addButton = try sub.inspect().find(viewWithAccessibilityIdentifier: "Add_Button")
        let cancelButton = try sub.inspect().find(viewWithAccessibilityIdentifier: "Cancel_Button")
        
        // Assert
        XCTAssertNotNil(locTextEdit)
        XCTAssertNotNil(addButton)
        XCTAssertNotNil(cancelButton)
    }
    
    /**
     Validate cancel button dismisses Add Location Modal
     */
    func testAddLocationModalCancel() throws {
        // Arrange
        
        // Act
        try sub.inspect().find(viewWithAccessibilityIdentifier: "add_button").button().tap()
        let cancelButton = try sub.inspect().find(viewWithAccessibilityIdentifier: "Cancel_Button")
        try cancelButton.button().tap()
        
        // Assert
        XCTAssertThrowsError(try sub.inspect().find(viewWithAccessibilityIdentifier: "Add_Location_Modal"))
    }
}
