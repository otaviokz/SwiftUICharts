//
//  DonutSegmentView.swift
//  
//
//  Created by Otávio Zabaleta on 26/09/2022.
//

import SwiftUI

struct SCDonutSegmentView: View {
    private let segment: SCDonutSegment
    
    init(_ segment: SCDonutSegment) {
        self.segment = segment
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Path { path in
                    path.addArc(proxy.minSideCentre, radius: segment.radius, arc: segment.arc)
                }
                .stroke(segment.color, lineWidth: segment.width)
                
                Text(segment.data.chartPercentString(with: .percent))
                    .font(.callout)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .frame(maxWidth: segment.width * Metric.widthRatio)
                    .position(segment.labelPosition(from: proxy.centre))
            }
        }
    }
}

private extension SCDonutSegmentView {
    struct Metric {
        static var widthRatio: CGFloat { 0.6 }
    }
}
