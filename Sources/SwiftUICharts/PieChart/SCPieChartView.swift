//
//  SCPieChartView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

public struct SCPieChartView: View {
    private let data: [SCDataPoint]
    private let title: String
    private let padding: CGFloat
    let rFraction: CGFloat
    let wFraction: CGFloat
    private let formatter: NumberFormatter?
    
    public init(
        _ data: [SCDataPoint],
        title: String,
        padding: CGFloat = 16,
        wFraction: CGFloat = 0.75,
        rFraction: CGFloat = 0.60,
        formatter: NumberFormatter? = nil
    ) {
        let sorted: [SCDataPoint] = data.prefix(to: .pie)
        self.data = sorted
        self.title = title
        self.padding = padding
        self.wFraction = wFraction
        self.rFraction = rFraction
        self.formatter = formatter
    }
    
    public var body: some View {
        SCBasicChartView(title: title) { proxy in
            SCPieSlicesView(data, padding: padding, formatter: formatter)
                .frame(squareSide: proxy.minSize)
            HStack(alignment: .center, spacing: 16) {
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
            .frame(width: proxy.minSize - 2 * padding, height: 32)
            .padding(.bottom, padding)
            
            SCDataRowsView(data, formatter: formatter)
                .padding(.horizontal, padding * 1.5)
                .padding(.bottom, 12)
        }
    }
}

struct SCPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        SCPieChartView(SCDataPoint.sampleEmployment, title: "Employment status distributions", formatter: NumberFormatter.intgerValues)
    }
}
