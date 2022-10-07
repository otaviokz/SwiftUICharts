//
//  Color_HexTests.swift
//  
//
//  Created by Otávio Zabaleta on 06/10/2022.
//

import XCTest
import SwiftUI
@testable import SwiftUICharts

class Color_HexTests: XCTestCase {

    func testBasics() throws {
        // Then
        XCTAssertNotNil(Color(hex: "FF0000FF"))
        XCTAssertNotNil(Color(hex: "#0000FF"))
        XCTAssertNotNil(Color(hex: "00FF00FF"))
        XCTAssertNil(Color(hex: "00FF0"))
        XCTAssertNil(Color(hex: "XX0000FF"))
        
        let allValid = [Color](hex: "#4770b3", "e4b031FF", "#26727bFF", "50aed3")
        XCTAssertEqual(allValid.count, 4)
        let halfValid = [Color](hex: "X770b3", "e4b031", "04cc82FF", "#9e9ea21")
        XCTAssertEqual(halfValid.count, 2)
    }
}
