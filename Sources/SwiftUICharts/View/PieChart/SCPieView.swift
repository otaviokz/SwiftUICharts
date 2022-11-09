//
//  SCPieView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

struct SCPieView: View {
    private let data: [SCDataPoint]
    private let padding: CGFloat
    private let onChartMinPct: Double
    
    init(_ data: [SCDataPoint], padding: CGFloat, onChartMinPct: Double) {
        self.data = data
        self.padding = padding
        self.onChartMinPct = onChartMinPct
    }
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(data.parts(proxy.minSizeRadius, padding: padding)) { part in
                SCPiePartView(part, onChartMinPct: onChartMinPct)
            }
        }
    }
}

private extension Array where Element == SCDataPoint {
    func parts(_ radius: CGFloat, padding: CGFloat) -> [SCPiePart] {
        var from = Angle.degrees(-90)

        return map { data in
            let arc = Arc(from, from + data.delta)
            from = arc.to
            return SCPiePart(data, radius: radius, arc: arc, padding: padding)
        }
    }
}
