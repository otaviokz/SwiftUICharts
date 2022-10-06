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
        let uat = SCDataPoint.sampleGov.prefix(to: .donut)
        
        // Then
        XCTAssertEqual(uat[0].title, "Military")
        XCTAssertEqual(uat[0].value, 750000000)
        XCTAssertEqual(uat[0].color, Color(hex: "4770b3"))
        
        XCTAssertEqual(uat[3].title, "Education")
        XCTAssertEqual(uat[3].value, 100000000)
        XCTAssertEqual(uat[3].color, Color(hex: "50aed3"))
        
        XCTAssertEqual(uat.totalString(with: .usd), "$1,250,000,000")
    }

    func testRowPercentages() throws {
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
    
    func testChartPercentages() throws {
        // Given
        var uat = employment
        
        // Then
        XCTAssertEqual(uat.totaling, Double(980000))
        
        // When
        uat = uat.prefix(to: .pie)
        let percentValues: [String] = uat.map { $0.chartPercentString(with: .percent, threshold: 0.1) }
        let expectedValues = [41.8, 29.6, 12.2]
        let tuples = zip(percentValues, expectedValues).map { ($0, $1) }
        
        // Then
        for (result, expected) in tuples {
            XCTAssertEqual(result, "\(expected)\u{fe6a}")
        }
    }
    
    func testValueFormatting() throws {
        // Given
        let uat = home.computingPercentages()
        
        // Then
        XCTAssertEqual(uat[0].valueString(with: gbpFormatter), "£1,200")
        XCTAssertEqual(uat[1].valueString(with: gbpFormatter), "£800.12")
    }
    
    func testPercentageFormatting() throws {
        // Given
        let uat = home.computingPercentages()
        
        // Then
        XCTAssertEqual(uat[0].percentString(with: percentFormatter), "36.75%")
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
    
    private let home = SCDataPoint.sampleHome
    private let employment = SCDataPoint.sampleEmployment
}
