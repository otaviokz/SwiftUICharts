//
//  SCDataPointTests.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import XCTest
import SwiftUI
@testable import SwiftUICharts

class SCDataPointTests: XCTestCase {
    func testBasics() throws {
        // Given
        let uat = home
        
        // Then
        XCTAssertEqual(uat[0].title, "Rent")
        XCTAssertEqual(uat[0].value, 1200)
        XCTAssertEqual(uat[0].color, Color(hex: "4770b3"))
        
        XCTAssertEqual(uat[5].title, "Fun")
        XCTAssertEqual(uat[5].value, 575)
        XCTAssertEqual(uat[5].color, Color(hex: "9e9ea2"))
    }

    func testPercentages() throws {
        // Given
        var uat = home
        
        // Then
        XCTAssertEqual(uat.totaling, Double(3265.12))
        
        // When
        uat = uat.computingPercentages()
        let percentValues: [Double] = uat.map { $0.percentage * 100 }
        let expectedValues = [36.8, 24.5, 3.1, 5.8, 12.3, 17.6]
        let tuples = zip(percentValues, expectedValues).map { ($0, $1) }
        
        // Then
        for (result, expected) in tuples {
            XCTAssertEqual(result, expected, accuracy: 0.1)
        }
    }
    
    func testValueFormatting() throws {
        // Given
        let uat = home.computingPercentages()
        
        // Then
        XCTAssertEqual(uat[0].devaulfValueString, "1200.0")
        XCTAssertEqual(uat[0].valueString(), uat[0].devaulfValueString)
        XCTAssertEqual(uat[0].valueString(with: gbpFormatter), "£1,200")
        
        XCTAssertEqual(uat[1].devaulfValueString, "800.1")
        XCTAssertEqual(uat[1].valueString(), uat[1].devaulfValueString)
        XCTAssertEqual(uat[1].valueString(with: gbpFormatter), "£800.12")
    }
    
    func testPercentageFormatting() throws {
        // Given
        let uat = home.computingPercentages()
        
        // Then
        XCTAssertEqual(uat[0].defaultPercentSring, "36.8%")
        XCTAssertEqual(uat[0].percentString(), uat[0].defaultPercentSring)
        XCTAssertEqual(uat[0].percentString(with: percentFormatter), "36.75%")
        
        XCTAssertEqual(uat[1].defaultPercentSring, "24.5%")
        XCTAssertEqual(uat[1].percentString(), uat[1].defaultPercentSring)
        XCTAssertEqual(uat[1].percentString(with: percentFormatter), "24.51%")
    }
    
    
    private lazy var gbpFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "GBP"
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    private lazy var percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    private let home = SCDataPoint.sampleDataHouse
}
