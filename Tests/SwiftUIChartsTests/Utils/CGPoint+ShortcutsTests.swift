//
//  CGPoint+ShortcutsTests.swift
//  
//
//  Created by Otávio Zabaleta on 05/10/2022.
//

import XCTest
import SwiftUI
@testable import SwiftUICharts

class CGPoint_ShortcutsTests: XCTestCase {
    func testBasics() throws {
        // Then
        XCTAssertEqual(.zero * CGPoint(xy: 2), .zero)
        XCTAssertEqual(CGPoint(xy: 2) * CGPoint(xy: 2), CGPoint(xy: 4))
        XCTAssertEqual(CGPoint(3, 4) * CGPoint(5, 6), CGPoint(15, 24))
        XCTAssertEqual(CGPoint(12, 18) / 2, CGPoint(6, 9))
    }
}
