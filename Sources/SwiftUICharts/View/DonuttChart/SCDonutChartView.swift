//
//  SCDonutChartView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

public struct SCDonutChartView: View {
    private let data: [SCDataPoint]
    private let title: String
    
    public init(_ data: [SCDataPoint], title: String) {
        let sorted: [SCDataPoint] = data.prefix(to: .donut)
        self.data = sorted
        self.title = title
    }
    
    public var body: some View {
        SCBasicChartView(data, title: title) { proxy in
            SCDonutSegmentsView(data, lineWidth: proxy.minSize * Metric.lineRatio, padding: Metric.padding)
                .frame(squareSide: proxy.minSize)
        }
    }
}

private extension SCDonutChartView {
    struct Metric {
        static var padding: CGFloat { 16 }
        static var lineRatio: CGFloat { 0.2 }
    }
}
