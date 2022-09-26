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
    
    @inlinable func withPercentage(_ percentage: Double) -> SCDataPoint {
        SCDataPoint(title, value: value, color: color, percentage: percentage)
    }
    
    func percentString(with formatter: NumberFormatter? = nil) -> String {
        formatter?.string(for: percentage) ?? defaultPercentSring
    }
    
    func chartPercentString(with formatter: NumberFormatter? = nil, threshold: Double = 0.05) -> String {
        percentage >= threshold ? percentString(with: formatter) : ""
    }
    
    private var defaultPercentSring: String {
        String(format: "%.1f%%", percentage * 100)
    }
    
    var delta: Angle {
        .degrees(percentage * 360)
    }
}

extension Array where Element == SCDataPoint {
    @inlinable func computingPercentages() -> [SCDataPoint] {
        let total = totaling
        return map { $0.withPercentage($0.value / total) }
    }
    
    internal func prefix(to pallete: SCPalletes.Graph, descending: Bool = true) -> [SCDataPoint] {
        sorted(descending: descending).prefix(to: pallete).colored(to: pallete).computingPercentages()
    }
    
    private func prefix(to pallete: SCPalletes.Graph) -> [SCDataPoint] {
        [SCDataPoint](prefix(pallete.colors.count))
    }
    
    private func colored(to pallete: SCPalletes.Graph) -> [SCDataPoint] {
        zip(self, pallete.colors).map { $0.with($1) }
    }
}

extension SCDataPoint {
    private static var donut: [Color] { SCPalletes.Graph.donut.colors }
    private static var pie: [Color] { SCPalletes.Graph.pie.colors }
    
    public static var sampleHome: [SCDataPoint] {
        [
            SCDataPoint("Rent", value: 1200, color: donut[0]),
            SCDataPoint("Utility", value: 800.12, color: donut[1]),
            SCDataPoint("Petrol", value: 100, color: donut[2]),
            SCDataPoint("Council", value: 190, color: donut[3]),
            SCDataPoint("Groceries", value: 400, color: donut[4]),
            SCDataPoint("Fun", value: 575, color: donut[5])
        ]
    }
    
    public static var sampleGov: [SCDataPoint] {
        [
            SCDataPoint("Education", value: 100000000, color: donut[3]),
            SCDataPoint("Military", value: 750000000, color: donut[1]),
            SCDataPoint("Transport", value: 250000000, color: donut[2]),
            SCDataPoint("Health", value: 150000000, color: donut[0])
        ]
    }
    
    public static var sampleEmployment: [SCDataPoint] {
        [
            SCDataPoint("Employed full-time", value: 410000, color: pie[3]),
            SCDataPoint("Employed part-time", value: 290000, color: pie[1]),
            SCDataPoint("Self employed", value: 90000, color: pie[2]),
            SCDataPoint("Student", value: 120000, color: pie[0]),
            SCDataPoint("Unemployed", value: 70000, color: pie[0])
        ]
    }
    
    fileprivate func with(_ newColor: Color) -> SCDataPoint {
        SCDataPoint(title, value: value, color: newColor, percentage: percentage)
    }
}


