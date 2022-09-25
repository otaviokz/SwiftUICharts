//
//  SCDataRowsView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

import SwiftUI

struct SCDataRowsView: View {
    private let dataPoints: [SCDataPoint]
    private let formatter: NumberFormatter?
    private let totaling: CGFloat
    
    init(_ dataPoints: [SCDataPoint], formatter: NumberFormatter? = nil) {
        self.dataPoints = dataPoints
        self.formatter = formatter
        self.totaling = dataPoints.totaling
    }
    
    var body: some View {
        VStack(spacing: Metric.rowSpacing) {
            ForEach(dataPoints, id: \.id) { data in
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: Metric.rectangle / 4.0)
                        .frame(squareSide: Metric.rectangle)
                    Spacer().frame(width: Metric.namePadding)
                    Text(data.title)
                        .font(.title3)
                    Spacer().frame(width: Metric.rowSpacing)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text(data.valueString(with: formatter))
                            .font(fontForValues)
                        Text(data.percentString(with: .percent))
                            .font(percentageFont)
                    }.lineLimit(1)
                }
                .foregroundColor(data.color)
            }
        }
    }
}

private extension SCDataRowsView {
    struct Metric {
        static var rectangle: CGFloat { 32 }
        static var namePadding: CGFloat { 12 }
        static var rowSpacing: CGFloat { 6 }
    }
    
    var primaryValueFont: Font { .headline.weight(.medium) }
    var percentageFont: Font { .subheadline.weight(.semibold) }
    
    var fontForValues: Font {
        let largest = dataPoints[0].value
        if largest <= 999999999 {
            return primaryValueFont
        } else if largest <= 999999999999 {
            return .subheadline.weight(.regular)
        } else if largest <= 999999999999999 {
            return .body.weight(.regular)
        } else {
            return .callout.weight(.regular)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SCDataRowsView(SCDataPoint.sampleHome)
    }
}
