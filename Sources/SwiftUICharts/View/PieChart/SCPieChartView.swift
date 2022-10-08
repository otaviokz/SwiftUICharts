//
//  SCPieChartView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

public struct SCPieChartView: View {
    @Environment(\.numberFormattterEnvironmentValue) var formatter: NumberFormatter
    private let data: [SCDataPoint]
    private let title: String
    
    public init(_ data: [SCDataPoint], title: String) {
        let sorted: [SCDataPoint] = data.prefix(to: .pie)
        self.data = sorted
        self.title = title
    }
    
    public var body: some View {
        SCBasicChartView(data, title: title) { proxy in
            SCPieSlicesView(data, padding: Metric.padding)
                .frame(squareSide: proxy.minSide)
            HStack(spacing: Metric.padding) {
                Group {
                    Text("Total:")
                        .font(.title.weight(.bold))
                    Text(data.totalString(with: formatter))
                        .font(.title)
                }
                .lineLimit(1)
                .foregroundColor(.gray)
                .aspectRatio(1, contentMode: .fill)
            }
            .frame(width: proxy.minSide - Metric.totalPadding, height: Metric.totalHeight)
            .padding(.bottom, Metric.padding)
        }
    }
}

private extension SCPieChartView{
    struct Metric {
        static var padding: CGFloat { 16 }
        static var totalHeight: CGFloat { 32 }
        static var totalPadding: CGFloat { 2 * Metric.padding }
    }
}
