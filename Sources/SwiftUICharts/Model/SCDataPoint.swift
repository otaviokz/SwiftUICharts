//
//  SCDataPoint.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

public struct SCDataPoint: SCDataPointProtocol {
    public let title: String
    public let value: Double
    public let color: Color
    public let percentage: Double
    
    public init(_ title: String, value: Double, color: Color, percentage: Double = 0) {
        self.title = title
        self.value = value
        self.color = color
        self.percentage = percentage
    }
    
    @inlinable public func withPercentage(_ percentage: Double) -> SCDataPoint {
        SCDataPoint(title, value: value, color: color, percentage: percentage)
    }
    
    func percentString(with formatter: NumberFormatter? = nil) -> String {
        formatter?.string(for: percentage) ?? defaultPercentSring
    }
    
    var defaultPercentSring: String {
        String(format: "%.1f%%", percentage * 100)
    }
}

public extension Array where Element == SCDataPoint {
    @inlinable func computingPercentages() -> [SCDataPoint] {
        let total = totaling
        return map { $0.withPercentage($0.value / total) }
    }
}

extension SCDataPoint {
    private static var donut: SCPalletes.Graph { .donut }
    
    static var sampleDataHouse: [SCDataPoint] {
        [
            SCDataPoint("Rent", value: 1200, color: donut.colors[0]),
            SCDataPoint("Utility", value: 800.12, color: donut.colors[1]),
            SCDataPoint("Petrol", value: 100, color: donut.colors[2]),
            SCDataPoint("Council", value: 190, color: donut.colors[3]),
            SCDataPoint("Groceries", value: 400, color: donut.colors[4]),
            SCDataPoint("Fun", value: 575, color: donut.colors[5])
        ]
    }
}
