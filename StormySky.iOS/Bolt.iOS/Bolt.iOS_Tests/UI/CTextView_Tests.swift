//
//  CTextView_Tests.swift
//  Bolt.iOSTests
//
//  Created by Joseph Samyn on 12/17/22.
//

import XCTest
import ViewInspector
import SwiftUI
@testable import Bolt_iOS

extension CText: Inspectable {}

final class CTextView_Tests: XCTestCase {
    
    /* Properties */

    /**
     Test UI elements are all present in CText
     */
    func testCtextElements() throws {
        
        /* Arrange */
        let textExp = "Test"
        let sub = CText(textExp)
        
        /* Act */
        let labelRes = try sub.inspect().findAll(ViewType.Text.self)[0]
        let textRes = try labelRes.string()
        
        /* Assert */
        XCTAssertNotNil(labelRes)
        XCTAssertEqual(textExp, textRes)
    }
    
    /**
     Validate label color is correct
     */
    func testCTextLabelColor() throws {
        /* Arrange */
        let sub = CText("Test")
        let clrExp = Color("PrimaryDark")
        
        /* Act */
        let clrRes = try sub.inspect().findAll(ViewType.Text.self)[0].attributes().foregroundColor()
        
        /* Assert */
        XCTAssertEqual(clrExp, clrRes)
        
    }

}
