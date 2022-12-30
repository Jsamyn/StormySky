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
    
    /**
     Test Add Button styling
     */
    func testAddButtonStyling() throws {
        // Arrange
        let text = "Add"
        let bgColor = Color("PrimaryDark")
        let textColor = Color("SecondaryLight")
        let clipShapeExp = RoundedRectangle(cornerRadius: 10)
        
        // Act
        let button = try sub.inspect().find(viewWithAccessibilityIdentifier: "Add_Button")
        let textRes = try button.find(ViewType.Text.self).string()
        let bgColorRes = try button.background().color().value()
        let textColorRes = try button.find(ViewType.Text.self).attributes().foregroundColor()
        let clipShapeRes = try button.clipShape(RoundedRectangle.self).cornerSize
        
        // Assert
        XCTAssertEqual(text, textRes)
        XCTAssertEqual(bgColor, bgColorRes)
        XCTAssertEqual(textColor, textColorRes)
        XCTAssertEqual(clipShapeExp.cornerSize, clipShapeRes)
    }
    
    /**
     Test Cancel Button styling
     */
    func testCancelButton() throws {
        // Arrange
        let text = "Cancel"
        let fgColor = Color("PrimaryDark")
        let csExp = RoundedRectangle(cornerRadius: 10).cornerSize
        
        // Act
        let button = try sub.inspect().find(viewWithAccessibilityIdentifier: "Cancel_Button")
        let textRes = try button.find(ViewType.Text.self).string()
        let fgColorRes = try button.find(ViewType.Text.self).attributes().foregroundColor()
        let csRes = try button.clipShape(RoundedRectangle.self).cornerSize
        
        // Assert
        XCTAssertEqual(text, textRes)
        XCTAssertEqual(fgColor, fgColorRes)
        XCTAssertEqual(csExp, csRes)
    }

}
