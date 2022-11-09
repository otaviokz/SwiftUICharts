//
//  SCDonutChartView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

public struct SCDonutChartView: View {
    private let title: String
    private let data: [SCDataPoint]
    private let onChartMinPct: Double
    
    public init(_ title: String, data: [SCDataPoint], onChartMinPct: Double = 0.05) {
        self.title = title
        self.data = data.prefix(to: .donut)
        self.onChartMinPct = onChartMinPct
    }
    
    public var body: some View {
        SCChartWrapperView(title, data: data) { proxy in
            SCDonutView(
                data,
                weight: proxy.minSize * Metric.sizeRatio,
                padding: Metric.padding,
                onChartMinPct: onChartMinPct
            )
            .frame(square: proxy.minSize)
        }
    }
}

private extension SCDonutChartView {
    struct Metric {
        static var padding: CGFloat { 16 }
        static var sizeRatio: CGFloat { 0.2 }
    }
}
