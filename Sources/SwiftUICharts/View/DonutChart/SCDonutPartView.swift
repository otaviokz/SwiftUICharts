//
//  SCDonutPartView.swift
//  
//
//  Created by Otávio Zabaleta on 26/09/2022.
//

import SwiftUI

struct SCDonutPartView: View {
    private let part: SCDonutPart
    private let onChartMinPct: Double
    
    init(_ part: SCDonutPart, onChartMinPct: Double) {
        self.part = part
        self.onChartMinPct = onChartMinPct
    }
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                path.addArc(proxy.minSizeCentre, radius: part.radius, arc: part.arc)
            }
            .stroke(part.color, lineWidth: part.weight)
            
            Text(part.data.chartPctString(with: .percent, threshold: onChartMinPct))
                .font(.callout)
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .frame(maxWidth: part.weight * Metric.widthRatio)
                .position(part.labelPosition(from: proxy.centre))
        }
    }
}

private extension SCDonutPartView {
    struct Metric {
        static var widthRatio: CGFloat { 0.6 }
    }
}
