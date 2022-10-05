//
//  SCPieSliceTests.swift
//  
//
//  Created by Otávio Zabaleta on 05/10/2022.
//

import XCTest
import SwiftUI
@testable import SwiftUICharts

class SCPieSliceTests: XCTestCase {
    func testBasics() throws {
        // Given
        let slice = SCPieSlice(SCDataPoint("aTitle", value: 100, color: .red), radius: 240, arc: Arc(.degrees(0), .degrees(-90)), padding: 8)
        // Then
        XCTAssertEqual(slice.arcRad, 0.78, accuracy: 0.05)
        XCTAssertEqual(slice.arcRadius, 232)
        XCTAssertEqual(slice.labelPosition(from: CGPoint(x: 120, y: 120)).x, 194.24, accuracy: 0.05)
        XCTAssertEqual(slice.labelPosition(from: CGPoint(x: 120, y: 120)).y, 45.75, accuracy: 0.05)
        
    }
}
