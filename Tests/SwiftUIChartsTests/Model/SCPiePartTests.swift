//
//  SCPiePartTests.swift
//  
//
//  Created by Otávio Zabaleta on 05/10/2022.
//

import XCTest
import SwiftUI
@testable import SwiftUICharts

class SCPiePartTests: XCTestCase {
    func testBasics() throws {
        // Given
        let part1 = part(50, r: 240, arc: .degrees(0, -90), padding: 8)
        var middle = CGPoint(240, 240)
        
        // Then
        XCTAssertEqual(part1.midRadian, 0.78, accuracy: 0.05)
        XCTAssertEqual(part1.radius, 232)
        XCTAssertEqual(part1.labelPosition(from: middle).x, 360.5, accuracy: 0.05)
        XCTAssertEqual(part1.labelPosition(from: middle).y, 119.5, accuracy: 0.05)
        XCTAssertEqual(part1.title, "aPart")
        XCTAssertEqual(part1.color, .blue)
        XCTAssertEqual(part1.value, 50.0)
        XCTAssertEqual(part1.idString, "aPart50.0blue232.08.00.7853981633974483")
        
        // Given
        let part2 = part(50, r: 280, arc: .degrees(-90, -160), padding: 18)
        middle = CGPoint(280, 280)
        
        // Then
        XCTAssertEqual(part2.midRadian, 2.17, accuracy: 0.05)
        XCTAssertEqual(part2.radius, 262)
        XCTAssertEqual(part2.labelPosition(from: middle).x, 165.97, accuracy: 0.05)
        XCTAssertEqual(part2.labelPosition(from: middle).y, 117.15, accuracy: 0.05)
        XCTAssertEqual(part2.idString, "aPart50.0blue262.018.02.181661564992912")
        XCTAssertEqual(part2.id, part(50, r: 244, arc: .degrees(-90, -160), padding: 18).id)
    }
}

private extension SCPiePartTests {
    func part(_ v: Double, r: CGFloat, arc: Arc, padding: CGFloat) -> SCPiePart {
        SCPiePart(SCDataPoint("aPart", value: v, color: .blue), radius: r, arc: arc, padding: padding)
    }
}
