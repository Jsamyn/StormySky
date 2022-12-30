//
//  AddLocationModal_Tests.swift
//  Bolt.iOSTests
//
//  Created by Joseph Samyn on 12/29/22.
//

import XCTest
import ViewInspector
import SwiftUI
@testable import Bolt_iOS

extension AddLocationsModal: Inspectable {}

final class AddLocationModal_Tests: XCTestCase {
    
    var vm: LocationsViewModel!
    var sub: AddLocationsModal!
    
    override func setUp() {
        let service = UserLocationService()
        vm = LocationsViewModel(locationService: service)
        sub = AddLocationsModal(vm: vm)
    }

    /**
     Test all elements are present on modal
     */
    func testElementsPresent() throws {
        
        // Arrange
        
        // Act
        let locTextEdit = try sub.inspect().find(viewWithAccessibilityIdentifier: "Location_Text_Field")
        let addButton = try sub.inspect().find(viewWithAccessibilityIdentifier: "Add_Button")
        let cancelButton = try sub.inspect().find(viewWithAccessibilityIdentifier: "Cancel_Button")
        
        // Assert
        XCTAssertNotNil(locTextEdit)
        XCTAssertNotNil(addButton)
        XCTAssertNotNil(cancelButton)
    }
    
    /**
     Test TextField styling
     */
    func tesTextFieldtStyling() throws {
        // Arrange
        let textField = try sub.inspect().find(viewWithAccessibilityIdentifier: "Location_Text_Field")
        let bgColorExp = Color("Primary")
        let strokeColorExp = Color("Secondary")
        let strokeLineWidthExp = 1.0
        let phTextExp = "Enter zip code of location.."
        
        // Act
        let bgColorRes = try textField.background().shape().background().color().value()
        let strokeLineWidthRes = try textField.background().shape().strokeStyle().lineWidth
        let strokeColorRes = try textField.background().shape().fillShapeStyle(Color.self)
        let phTextRes = try textField.textField().labelView().text().string()
        
        // Assert
        XCTAssertEqual(bgColorExp, bgColorRes)
        XCTAssertEqual(strokeLineWidthExp, strokeLineWidthRes)
        XCTAssertEqual(strokeColorExp, strokeColorRes)
        XCTAssertEqual(phTextExp, phTextRes)
    }
    

}
