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
    private let rFraction: CGFloat
    private let wFraction: CGFloat
    private let formatter: NumberFormatter?
    private var backgroundColor: Color {
        colorScheme == .dark ? .white : .black
    }
    
    init(
        _ data: [SCDataPoint],
        padding: CGFloat,
        wFraction: CGFloat = 0.75,
        rFraction: CGFloat = 0.5,
        formatter: NumberFormatter? = nil
    ) {
        self.data = data
        self.padding = padding
        self.wFraction = wFraction
        self.rFraction = rFraction
        self.formatter = formatter
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(data.asPieSlices(proxy.minRadius, padding: padding), id: \.id) { slice in
                    PieSliceView(slice)
                }
                .frame(width: wFraction * proxy.minSize, height: wFraction * proxy.minSize)
            }
            .frame(squareSide: proxy.minSize)
        }
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
