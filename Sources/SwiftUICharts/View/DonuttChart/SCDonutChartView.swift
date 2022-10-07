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
        SCBasicChartView(title: title) { proxy in
            SCDonutSegmentsView(data, lineWidth: proxy.minSize * Metric.lineRatio, padding: Metric.padding)
                .frame(squareSide: proxy.minSize)
            
            SCDataRowsView(data)
                .padding(.horizontal, Metric.horizontalPadding)
                .padding(.bottom, Metric.bottom)
        }
    }
}

private extension SCDonutChartView {
    struct Metric {
        static var bottom: CGFloat { 12 }
        static var padding: CGFloat { 16 }
        static var horizontalPadding: CGFloat { padding * 1.5 }
        static var lineRatio: CGFloat { 0.2 }
    }
}
