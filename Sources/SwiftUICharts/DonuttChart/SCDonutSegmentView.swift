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
                    path.addArc(proxy.minCentre, radius: segment.arcRadius, arc: segment.arc)
                }
                .stroke(segment.color, lineWidth: segment.width)
                
                Text(segment.data.chartPercentString(with: .percent))
                    .font(.callout)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .frame(maxWidth: segment.width * 0.6)
                    .position(segment.labelPosition(from: proxy.middle))
            }
        }
    }
}
