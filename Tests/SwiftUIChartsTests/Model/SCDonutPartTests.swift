//
//  SCDonutPartTests.swift
//  
//
//  Created by Otávio Zabaleta on 05/10/2022.
//

import XCTest
import SwiftUI
@testable import SwiftUICharts

class SCDonutPartTests: XCTestCase {
    func testBasics() throws {
        // Given
        let part1 = part(100, r: 240, arc: .degrees(0, -90), w: 80, p: 12)
        var middle = CGPoint(240, 240)
        
        // Then
        XCTAssertEqual(part1.midRadian, 0.78, accuracy: 0.05)
        XCTAssertEqual(part1.radius, 188)
        XCTAssertEqual(part1.labelPosition(from: middle).x, 360.49, accuracy: 0.05)
        XCTAssertEqual(part1.labelPosition(from: middle).y, 119.5, accuracy: 0.05)
        XCTAssertEqual(part1.title, "aPart")
        XCTAssertEqual(part1.color, .red)
        XCTAssertEqual(part1.value, 100.0)
        XCTAssertEqual(part1.idString, "aPart100.0red188.012.00.785398163397448380.0")
        
        // Given
        let part2 = part(100, r: 280, arc: .degrees(-90, -145), w: 80, p: 8)
        middle = CGPoint(280, 280)
        
        // Then
        XCTAssertEqual(part2.midRadian, 2.05, accuracy: 0.05)
        XCTAssertEqual(part2.radius, 232)
        XCTAssertEqual(part2.labelPosition(from: middle).x, 188.2, accuracy: 0.05)
        XCTAssertEqual(part2.labelPosition(from: middle).y, 103.66, accuracy: 0.05)
        XCTAssertEqual(part2.idString, "aPart100.0red232.08.02.050761871093337580.0")
    }
}

private extension SCDonutPartTests {
    func part(_ v: Double, r: CGFloat, arc: Arc, w: CGFloat, p: CGFloat) -> SCDonutPart {
        SCDonutPart(SCDataPoint("aPart", value: v, color: .red), radius: r, arc: arc, weight: w, padding: p)
    }
}
