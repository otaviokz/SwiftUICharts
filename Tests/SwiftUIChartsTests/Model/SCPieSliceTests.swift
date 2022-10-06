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
        let slice1 = slice(radius: 240, arc: .degreesTo(-90), padding: 8)
        var middle = CGPoint(240, 240)
        
        // Then
        XCTAssertEqual(slice1.midRadian, 0.78, accuracy: 0.05)
        XCTAssertEqual(slice1.radius, 232)
        XCTAssertEqual(slice1.labelPosition(from: middle).x, 388.5, accuracy: 0.05)
        XCTAssertEqual(slice1.labelPosition(from: middle).y, 91.5, accuracy: 0.05)
        XCTAssertEqual(slice1.title, "aSliceTitle")
        XCTAssertEqual(slice1.color, .blue)
        XCTAssertEqual(slice1.value, 50.0)
        XCTAssertEqual(slice1.idString, "aSliceTitle50.0blue8.00.7853981633974483")
        
        // Given
        let slice2 = slice(radius: 280, arc: .degrees(-90, -180), padding: 12)
        middle = CGPoint(280, 280)
        
        // Then
        XCTAssertEqual(slice2.midRadian, 2.35, accuracy: 0.05)
        XCTAssertEqual(slice2.radius, 268)
        XCTAssertEqual(slice2.labelPosition(from: middle).x, 106.75, accuracy: 0.05)
        XCTAssertEqual(slice2.labelPosition(from: middle).y, 106.75, accuracy: 0.05)
    }
}

private extension SCPieSliceTests {
    func slice(_ title: String = "aSliceTitle", value: Double = 50, radius: CGFloat, arc: Arc, padding: CGFloat) -> SCPieSlice {
        .init(.init(title, value: value, color: .blue), radius: radius, arc: arc, padding: padding)
    }
}
