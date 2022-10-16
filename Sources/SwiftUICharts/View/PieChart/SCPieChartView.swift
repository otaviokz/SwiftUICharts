//
//  SCPieChartView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

public struct SCPieChartView: View {
    @Environment(\.numberFormatter) var formatter: NumberFormatter
    private let data: [SCDataPoint]
    private let title: String
    
    public init(_ data: [SCDataPoint], title: String) {
        self.data = data.prefix(to: .pie)
        self.title = title
    }
    
    public var body: some View {
        SCChartWrapperView(data, title: title) { proxy in
            SCPieView(data, padding: Metric.padding)
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
