//
//  SCPieChartView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

public struct SCPieChartView: View {
    @Environment(\.numberFormatter) var formatter: NumberFormatter
    private let title: String
    private let data: [SCDataPoint]
    private let onChartMinPct: Double
    
    public init(_ title: String, data: [SCDataPoint], onChartMinPct: Double = 0.05) {
        self.title = title
        self.data = data.prefix(to: .pie)
        self.onChartMinPct = onChartMinPct
    }
    
    public var body: some View {
        SCChartWrapperView(title, data: data) { proxy in
            SCPieView(data, padding: Metric.padding, onChartMinPct: onChartMinPct)
                .frame(square: proxy.minSize)
            
            HStack {
                Group {
                    Text("Total:").bold()
                    Text(data.totalString(with: formatter))
                }
                .font(.title)
                .lineLimit(1)
                .foregroundColor(.gray)
                .aspectRatio(1, contentMode: .fill)
            }
            .frame(width: proxy.minSize - 2 * Metric.padding, height: Metric.totalHeight)
            .padding(.bottom, Metric.bottom)
        }
    }
}

private extension SCPieChartView{
    struct Metric {
        static var padding: CGFloat { 16 }
        static var bottom: CGFloat { 16 }
        static var totalHeight: CGFloat { 32 }
    }
}
