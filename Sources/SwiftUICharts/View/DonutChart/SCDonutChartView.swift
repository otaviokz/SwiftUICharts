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
        self.data = data.prefix(to: .donut)
        self.title = title
    }
    
    public var body: some View {
        SCChartWrapperView(data, title: title) { proxy in
            SCDonutView(data, weight: proxy.minSize * Metric.weightRatio, padding: Metric.padding)
                .frame(square: proxy.minSize)
        }
    }
}

private extension SCDonutChartView {
    struct Metric {
        static var padding: CGFloat { 16 }
        static var weightRatio: CGFloat { 0.2 }
    }
}
