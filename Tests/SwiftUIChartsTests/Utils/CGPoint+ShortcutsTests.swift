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
        XCTAssertEqual(.zero * CGPoint(2, 2), .zero)
        XCTAssertEqual(CGPoint(2, 2) * CGPoint(2, 2), CGPoint(4, 4))
        XCTAssertEqual(CGPoint(3, 4) * CGPoint(5, 6), CGPoint(15, 24))
    }
}
