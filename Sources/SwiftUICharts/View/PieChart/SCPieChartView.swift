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
        SCBasicChartView(title: title) { proxy in
            SCPieSlicesView(data, padding: Metric.padding)
                .frame(squareSide: proxy.minSize)
            HStack(alignment: .center, spacing: Metric.hSpacing) {
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
            .frame(width: proxy.minSize - Metric.totalWidthFix, height: Metric.totalHeight)
            .padding(.bottom, Metric.padding)
            
            SCDataRowsView(data)
                .padding(.horizontal, Metric.rowsHorizontal)
                .padding(.bottom, Metric.rowsBottom)
        }
    }
}

private extension SCPieChartView{
    struct Metric {
        static var padding: CGFloat { 16 }
        static var hSpacing: CGFloat { 16 }
        static var totalHeight: CGFloat { 32 }
        static var rowsBottom: CGFloat { 12 }
        static var rowsHorizontal: CGFloat { padding * 1.5 }
        static var totalWidthFix: CGFloat { 2 * Metric.padding }
    }
}
