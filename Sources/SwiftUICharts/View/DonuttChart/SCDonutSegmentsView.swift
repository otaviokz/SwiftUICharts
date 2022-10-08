//
//  SCDonutSegmentsView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

struct SCDonutSegmentsView: View {
    @Environment(\.numberFormattterEnvironmentValue) var formatter: NumberFormatter
    private let data: [SCDataPoint]
    private let lineWidth: CGFloat
    private let padding: CGFloat
    
    init(_ data: [SCDataPoint], lineWidth: CGFloat, padding: CGFloat) {
        self.data = data
        self.lineWidth = lineWidth
        self.padding = padding
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(data.segments(proxy, width: lineWidth, padding: padding), id: \.id) { segment in
                    SCDonutSegmentView(segment)
                }
                
                VStack(spacing: 0) {
                    Text("Total:")
                        .font(.title.weight(.bold))
                    Text(data.totalString(with: formatter))
                        .font(.title)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.gray)
                .frame(squareSide: proxy.minSide - Metric.textSizeFactor * (lineWidth + padding))
            }
            .frame(squareSide: proxy.minSide)
        }
    }
}

private extension SCDonutSegmentsView {
    struct Metric {
        static var textSizeFactor: CGFloat { 2.25 }
    }
}

private extension Array where Element == SCDataPoint {
    func segments(_ proxy: GeometryProxy, width: CGFloat, padding: CGFloat) -> [SCDonutSegment] {
        var from = Angle.degrees(-90)
        
        return map { data in
            let arc = Arc(from, from + data.delta)
            from = arc.to
            return SCDonutSegment(data, radius: proxy.minRadius, arc: arc, width: width, padding: padding)
        }
    }
}
