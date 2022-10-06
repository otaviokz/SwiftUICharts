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
        let slice1 = slice(50, r: 240, arc: .degreesTo(-90), padding: 8)
        var middle = CGPoint(240, 240)
        
        // Then
        XCTAssertEqual(slice1.midRadian, 0.78, accuracy: 0.05)
        XCTAssertEqual(slice1.radius, 232)
        XCTAssertEqual(slice1.labelPosition(from: middle).x, 388.5, accuracy: 0.05)
        XCTAssertEqual(slice1.labelPosition(from: middle).y, 91.5, accuracy: 0.05)
        XCTAssertEqual(slice1.title, "aSlice")
        XCTAssertEqual(slice1.color, .blue)
        XCTAssertEqual(slice1.value, 50.0)
        XCTAssertEqual(slice1.idString, "aSlice50.0blue232.08.00.7853981633974483")
        
        // Given
        let slice2 = slice(50, r: 280, arc: .degrees(-90, -160), padding: 18)
        middle = CGPoint(280, 280)
        
        // Then
        XCTAssertEqual(slice2.midRadian, 2.17, accuracy: 0.05)
        XCTAssertEqual(slice2.radius, 262)
        XCTAssertEqual(slice2.labelPosition(from: middle).x, 139.47, accuracy: 0.05)
        XCTAssertEqual(slice2.labelPosition(from: middle).y, 79.3, accuracy: 0.05)
        XCTAssertEqual(slice2.idString, "aSlice50.0blue262.018.02.181661564992912")
    }
}

private extension SCPieSliceTests {
    func slice(_ v: Double, r: CGFloat, arc: Arc, padding: CGFloat) -> SCPieSlice {
        SCPieSlice(SCDataPoint("aSlice", value: v, color: .blue), radius: r, arc: arc, padding: padding)
    }
}
