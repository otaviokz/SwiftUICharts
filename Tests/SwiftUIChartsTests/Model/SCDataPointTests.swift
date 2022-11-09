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
        XCTAssertEqual(uat.totalString(), "1250000000.0")
        XCTAssertEqual(uat.totalString(with: .intgerValues), "1,250,000,000")
        
        XCTAssertEqual(uat[0].id, SCDataPoint("Military", value: 750000000, color: Color(hex: "4770b3")!).id)
    }

    func testRowPctages() throws {
        // Given
        var uat = SCDataPoint.sampleHome
        
        // Then
        XCTAssertEqual(uat.totaling, Double(3265.12))
        
        // When
        uat = uat.computingPercentages()
        let pctValues: [Double] = uat.map { $0.percentage * 100 }
        let expectedPctValues = [36.8, 24.5, 3.1, 5.8, 12.3, 17.6]
        let tuples = zip(pctValues, expectedPctValues).map { ($0, $1) }
        
        // Then
        for (result, expected) in tuples {
            XCTAssertEqual(result, expected, accuracy: 0.1)
        }
    }
    
    func testChartPercentages() throws {
        // Given
        var uat = SCDataPoint.sampleEmployment
        
        // Then
        XCTAssertEqual(uat.totaling, Double(980000))
        
        // When
        uat = uat.prefix(to: .pie)
        let pctValues: [String] = uat.map { $0.chartPctString(with: .percent, threshold: 0.1) }
        let expectedPctValues = [41.8, 29.6, 12.2]
        let tuples = zip(pctValues, expectedPctValues).map { ($0, $1) }
        
        // Then
        for (result, expected) in tuples {
            XCTAssertEqual(result, "\(expected)\u{fe6a}")
        }
    }
    
    func testValueFormatting() throws {
        // Given
        let uat = SCDataPoint.sampleHome.prefix(to: .donut, descending: false)
        
        // Then
        XCTAssertEqual(uat[0].valueString(with: .gbp), "£100")
        XCTAssertEqual(uat[1].valueString(with: .gbp), "£190")
        XCTAssertEqual(uat[1].valueString(), "190.0")
    }
    
    func testPercentageFormatting() throws {
        // Given
        let uat = SCDataPoint.sampleHome.computingPercentages()
        
        // Then
        XCTAssertEqual(uat[0].pctString(with: .percent), "36.8\u{fe6a}")
        XCTAssertEqual(uat[1].pctString(with: .percent), "24.5\u{fe6a}")
        XCTAssertEqual(uat[1].pctString(), "24.5\u{fe6a}")
    }
    
    func testAngles() {
        // Given
        let uat = SCDataPoint.sampleHome.computingPercentages()
        
        // Then
        XCTAssertEqual(uat[0].delta.radians, 2.3, accuracy: 0.1)
    }
}
