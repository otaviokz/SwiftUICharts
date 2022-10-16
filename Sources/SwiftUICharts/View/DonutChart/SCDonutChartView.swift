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
    
    public init(_ title: String, data: [SCDataPoint]) {
        self.title = title
        self.data = data.prefix(to: .donut)
    }
    
    public var body: some View {
        SCChartWrapperView(title, data: data) { proxy in
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
