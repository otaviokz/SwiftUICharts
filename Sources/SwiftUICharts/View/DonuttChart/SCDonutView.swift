//
//  SCDonutView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

struct SCDonutView: View {
    @Environment(\.numberFormatter) var formatter: NumberFormatter
    
    private let data: [SCDataPoint]
    private let weight: CGFloat
    private let padding: CGFloat
    
    init(_ data: [SCDataPoint], weight: CGFloat, padding: CGFloat) {
        self.data = data
        self.weight = weight
        self.padding = padding
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(data.segments(proxy.minRadius, weight: weight, padding: padding)) { segment in
                    SCDonutSegmentView(segment)
                }
                
                VStack(spacing: 0) {
                    Text("Total:")
                        .font(.title.bold)
                    Text(data.totalString(with: formatter))
                        .font(.title)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.gray)
                .frame(square: proxy.minSide - Metric.textSizeFactor * (weight + padding))
            }
            .frame(square: proxy.minSide)
        }
    }
}

private extension SCDonutView {
    struct Metric {
        static var textSizeFactor: CGFloat { 2.25 }
    }
}

private extension Array where Element == SCDataPoint {
    func segments(_ radius: CGFloat, weight: CGFloat, padding: CGFloat) -> [SCDonutSegment] {
        var from = Angle.degrees(-90)
        
        return map { data in
            let arc = Arc(from, from + data.delta)
            from = arc.to
            return SCDonutSegment(data, radius: radius, arc: arc, weight: weight, padding: padding)
        }
    }
}
