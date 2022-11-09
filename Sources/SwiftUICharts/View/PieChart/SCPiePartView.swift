//
//  SCPiePartView.swift
//  
//
//  Created by Otávio Zabaleta on 26/09/2022.
//

import SwiftUI

struct SCPiePartView: View  {
    private let part: SCPiePart
    private let onChartMinPct: Double
    
    init(_ part: SCPiePart, onChartMinPct: Double) {
        self.part = part
        self.onChartMinPct = onChartMinPct
    }
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                path.move(to: proxy.centre)
                path.addArc(proxy.centre, radius: part.radius, arc: part.arc)
            }
            .fill(part.data.color)
            
            Text(part.data.chartPctString(with: .percent, threshold: onChartMinPct))
                .font(.callout)
                .foregroundColor(.white)
                .lineLimit(1)
                .position(part.labelPosition(from: proxy.centre))
        }
    }
}
