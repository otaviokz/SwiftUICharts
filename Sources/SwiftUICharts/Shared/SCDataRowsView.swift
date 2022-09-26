//
//  SCDataRowsView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

struct SCDataRowsView: View {
    @Environment(\.numberFormattterEnvironmentValue) var formatter: NumberFormatter
    private let data: [SCDataPoint]
    
    init(_ data: [SCDataPoint]) {
        self.data = data
    }
    
    var body: some View {
        VStack(spacing: Metric.rowSpacing) {
            ForEach(data, id: \.id) { data in
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: Metric.rectangle / 4.0)
                        .frame(squareSide: Metric.rectangle)
                    Spacer().frame(width: Metric.titlePadding)
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
        static var titlePadding: CGFloat { 12 }
        static var rowSpacing: CGFloat { 6 }
    }
    
    var primaryValueFont: Font { .headline.weight(.medium) }
    var percentageFont: Font { .subheadline.weight(.semibold) }
    
    var fontForValues: Font {
        let largest = data[0].value
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
