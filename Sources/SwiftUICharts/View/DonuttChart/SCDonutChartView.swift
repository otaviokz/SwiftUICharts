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
    private let padding: CGFloat
    private let lineRatio: CGFloat = 0.2
    
    public init(_ data: [SCDataPoint], title: String, padding: CGFloat = 16) {
        let sorted: [SCDataPoint] = data.prefix(to: .donut)
        self.data = sorted
        self.title = title
        self.padding = padding
    }
    
    public var body: some View {
        SCBasicChartView(title: title) { proxy in
            SCDonutSegmentsView(data, lineWidth: proxy.minSize * lineRatio, padding: padding)
                .frame(squareSide: proxy.minSize)
            
            SCDataRowsView(data)
                .padding(.horizontal, padding * 1.5)
                .padding(.bottom, 12)
        }
    }
}

struct SCDonutChartView_Previews: PreviewProvider {
    static var previews: some View {
        SCDonutChartView(SCDataPoint.sampleHome, title: "Home Budget")
    }
}
