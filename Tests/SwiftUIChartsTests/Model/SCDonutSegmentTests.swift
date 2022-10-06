//
//  File.swift
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
        let segmet1 = segment(radius: 240, arc: .degreesTo(-90), width: 80, padding: 12)
        var middle = CGPoint(240, 240)
        
        // Then
        XCTAssertEqual(segmet1.midRadian, 0.78, accuracy: 0.05)
        XCTAssertEqual(segmet1.radius, 188)
        XCTAssertEqual(segmet1.labelPosition(from: middle).x, 360.49, accuracy: 0.05)
        XCTAssertEqual(segmet1.labelPosition(from: middle).y, 119.5, accuracy: 0.05)
        XCTAssertEqual(segmet1.title, "aSegmentTitle")
        XCTAssertEqual(segmet1.color, .red)
        XCTAssertEqual(segmet1.value, 100.0)
        XCTAssertEqual(segmet1.idString, "aSegmentTitle100.0red80.012.00.7853981633974483")
        
        // Given
        let segmet2 = segment(radius: 280, arc: .degrees(-90, -180), width: 80, padding: 12)
        middle = CGPoint(280, 280)
        
        // Then
        XCTAssertEqual(segmet2.midRadian, 2.35, accuracy: 0.05)
        XCTAssertEqual(segmet2.radius, 228)
        XCTAssertEqual(segmet2.labelPosition(from: middle).x, 139.42, accuracy: 0.05)
        XCTAssertEqual(segmet2.labelPosition(from: middle).y, 139.42, accuracy: 0.05)
    }
}

private extension SCDonutSegmentTests {
    func segment(_ title: String = "aSegmentTitle", value: Double = 100, radius: CGFloat, arc: Arc, width: CGFloat, padding: CGFloat) -> SCDonutSegment {
        SCDonutSegment(SCDataPoint(title, value: value, color: .red), radius: radius, arc: arc, width: width, padding: padding)
    }
}
