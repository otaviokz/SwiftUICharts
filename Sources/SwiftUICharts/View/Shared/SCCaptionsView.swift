//
//  SCCaptionsView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

struct SCCaptionsView: View {
    @Environment(\.numberFormatter) var formatter: NumberFormatter
    private let data: [SCDataPoint]
    
    init(_ data: [SCDataPoint]) {
        self.data = data
    }
    
    var body: some View {
        VStack(spacing: Metric.spacing) {
            ForEach(data) { data in
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: Metric.rectangle / 4.0)
                        .frame(square: Metric.rectangle)
                    Spacer()
                        .frame(width: Metric.titlePadding)
                    Text(data.title)
                        .font(.title3)
                    Spacer()
                        .frame(width: Metric.spacing)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text(data.valueString(with: formatter))
                            .font(fontForValues)
                        Text(data.percentString(with: .percent))
                            .font(percentageFont)
                    }
                    .lineLimit(1)
                }
                .foregroundColor(data.color)
            }
        }
    }
}

private extension SCCaptionsView {
    struct Metric {
        static var rectangle: CGFloat { 32 }
        static var titlePadding: CGFloat { 12 }
        static var spacing: CGFloat { 6 }
    }
    
    var primaryValueFont: Font { .headline.medium }
    var percentageFont: Font { .subheadline.semibold }
    
    var fontForValues: Font {
        let largest = data[0].value
        if largest <= 999999999 {
            return primaryValueFont
        } else if largest <= 999999999999 {
            return .subheadline
        } else if largest <= 999999999999999 {
            return .body
        } else {
            return .callout
        }
    }
}
