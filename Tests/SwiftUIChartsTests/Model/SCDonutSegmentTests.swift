//
//  SCDonutSegmentTests.swift
//  
//
//  Created by Otávio Zabaleta on 05/10/2022.
//

import XCTest
import SwiftUI
@testable import SwiftUICharts

class SCDonutSegmentTests: XCTestCase {
    func testBasics() throws {
        // Given
        let segment1 = segment(100, r: 240, arc: .degrees(0, -90), w: 80, p: 12)
        var middle = CGPoint(240, 240)
        
        // Then
        XCTAssertEqual(segment1.midRadian, 0.78, accuracy: 0.05)
        XCTAssertEqual(segment1.radius, 188)
        XCTAssertEqual(segment1.labelPosition(from: middle).x, 360.49, accuracy: 0.05)
        XCTAssertEqual(segment1.labelPosition(from: middle).y, 119.5, accuracy: 0.05)
        XCTAssertEqual(segment1.title, "aSegment")
        XCTAssertEqual(segment1.color, .red)
        XCTAssertEqual(segment1.value, 100.0)
        XCTAssertEqual(segment1.idString, "aSegment100.0red188.012.00.785398163397448380.0")
        
        // Given
        let segment2 = segment(100, r: 280, arc: .degrees(-90, -145), w: 80, p: 8)
        middle = CGPoint(280, 280)
        
        // Then
        XCTAssertEqual(segment2.midRadian, 2.05, accuracy: 0.05)
        XCTAssertEqual(segment2.radius, 232)
        XCTAssertEqual(segment2.labelPosition(from: middle).x, 188.2, accuracy: 0.05)
        XCTAssertEqual(segment2.labelPosition(from: middle).y, 103.66, accuracy: 0.05)
        XCTAssertEqual(segment2.idString, "aSegment100.0red232.08.02.050761871093337580.0")
    }
}

private extension SCDonutSegmentTests {
    func segment(_ v: Double, r: CGFloat, arc: Arc, w: CGFloat, p: CGFloat) -> SCDonutSegment {
        SCDonutSegment(SCDataPoint("aSegment", value: v, color: .red), radius: r, arc: arc, width: w, padding: p)
    }
}
