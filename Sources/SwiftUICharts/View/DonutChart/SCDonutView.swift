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
    private let onChartMinPct: Double
    
    init(_ data: [SCDataPoint], weight: CGFloat, padding: CGFloat, onChartMinPct: Double) {
        self.data = data
        self.weight = weight
        self.padding = padding
        self.onChartMinPct = onChartMinPct
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(data.parts(proxy.minSizeRadius, weight: weight, padding: padding)) { part in
                    SCDonutPartView(part, onChartMinPct: onChartMinPct)
                }
                
                VStack(spacing: 0) {
                    Text("Total:")
                        .font(.title.semibold)
                    Text(data.totalString(with: formatter))
                        .font(.title)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.gray)
                .frame(square: proxy.minSize - Metric.textSizeFactor * (weight + padding))
            }
        }
    }
}

private extension SCDonutView {
    struct Metric {
        static var textSizeFactor: CGFloat { 2.25 }
    }
}

private extension Array where Element == SCDataPoint {
    func parts(_ radius: CGFloat, weight: CGFloat, padding: CGFloat) -> [SCDonutPart] {
        var from = Angle.degrees(-90)
        
        return map { data in
            let arc = Arc(from, from + data.delta)
            from = arc.to
            return SCDonutPart(data, radius: radius, arc: arc, weight: weight, padding: padding)
        }
    }
}
