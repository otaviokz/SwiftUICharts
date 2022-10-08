//
//  SCPieSlicesView.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

struct SCPieSlicesView: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    private let data: [SCDataPoint]
    private let padding: CGFloat
    private var backgroundColor: Color {
        colorScheme == .dark ? .white : .black
    }
    
    init(_ data: [SCDataPoint], padding: CGFloat) {
        self.data = data
        self.padding = padding
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(data.asPieSlices(proxy.minRadius, padding: padding), id: \.id) { slice in
                    PieSliceView(slice)
                        .frame(squareSide: proxy.minSide * Metric.sizeRatio)
                }
            }
            .frame(squareSide: proxy.minSide)
        }
    }
}

private extension SCPieSlicesView {
    struct Metric {
        static var sizeRatio: CGFloat { 0.6 }
    }
}

extension Array where Element == SCDataPoint {
    func asPieSlices(_ radius: CGFloat, padding: CGFloat) -> [SCPieSlice] {
        var from = Angle.degrees(-90)

        return map { data in
            let arc = Arc(from, from + data.delta)
            from = arc.to
            return SCPieSlice(data, radius: radius, arc: arc, padding: padding)
        }
    }
}
