//
//  SCDonutChartView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

public struct SCDonutChartView: View {
    private let dataPoints: [SCDataPoint]
    private let title: String
    private let padding: CGFloat
    private let formatter: NumberFormatter?
    private let lineRatio: CGFloat = 0.2
    @State private var vHeight: CGFloat = 0
    
    public init(_ dataPoints: [SCDataPoint], title: String, padding: CGFloat = 16, formatter: NumberFormatter? = nil) {
        let sorted: [SCDataPoint] = dataPoints.prefix(to: .donut)
        self.dataPoints = sorted
        self.title = title
        self.padding = padding
        self.formatter = formatter
    }
    
    public var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                    .frame(height: 12)
                
                Text(title)
                    .font(.title.weight(.semibold))
                    .foregroundColor(.gray)
                
                SCDonutSegmentsView(dataPoints, lineWidth: proxy.minSize * lineRatio, padding: padding, formatter: formatter)
                    .frame(squareSide: proxy.minSize)
                
                SCDataRowsView(dataPoints, formatter: formatter)
                    .padding(.horizontal, padding * 1.5)
                    .padding(.bottom, 12)
            }
            .frame(width: proxy.minSize)
            .padding(.vertical, 12)
            .readHeight(for: $vHeight)
        }
        .frame(height: vHeight)
    }
}

struct SCDonutChartView_Previews: PreviewProvider {
    static var previews: some View {
        SCDonutChartView(SCDataPoint.sampleHome, title: "Home Budget")
    }
}
