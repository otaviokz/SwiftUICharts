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
    
    
    init(_ data: [SCDataPoint], padding: CGFloat) {
        self.data = data
        self.padding = padding
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(data.slices(proxy.minRadius, padding: padding)) { slice in
                    SCPieSliceView(slice)
                }
            }
            .frame(square: proxy.minSide)
        }
    }
}

extension Array where Element == SCDataPoint {
    func slices(_ radius: CGFloat, padding: CGFloat) -> [SCPieSlice] {
        var from = Angle.degrees(-90)

        return map { data in
            let arc = Arc(from, from + data.delta)
            from = arc.to
            return SCPieSlice(data, radius: radius, arc: arc, padding: padding)
        }
    }
}
