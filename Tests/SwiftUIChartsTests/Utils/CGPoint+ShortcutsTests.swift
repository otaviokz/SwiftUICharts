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
        XCTAssertEqual(.zero * CGPoint(x: 2, y: 2), .zero)
        XCTAssertEqual(CGPoint(x: 2, y: 2) * CGPoint(x: 2, y: 2), CGPoint(x: 4, y: 4))
        XCTAssertEqual(CGPoint(x: 3, y: 4) * CGPoint(x: 5, y: 6), CGPoint(x: 15, y: 24))
    }
}
