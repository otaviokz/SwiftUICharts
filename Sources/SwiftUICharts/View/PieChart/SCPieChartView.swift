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
                .frame(square: proxy.minSide)
            
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
            .frame(width: proxy.minSide - 2 * Metric.padding, height: Metric.height)
            .padding(.bottom, Metric.padding)
        }
    }
}

private extension SCPieChartView{
    struct Metric {
        static var padding: CGFloat { 16 }
        static var height: CGFloat { 32 }
    }
}
