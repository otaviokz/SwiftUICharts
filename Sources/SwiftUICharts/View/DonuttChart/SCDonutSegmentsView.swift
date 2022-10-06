//
//  SCDonutSegmentsView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

struct SCDonutSegmentsView: View {
    @Environment(\.numberFormattterEnvironmentValue) var formatter: NumberFormatter
    private let data: [SCDataPoint]
    private let lineWidth: CGFloat
    private let padding: CGFloat
    
    init(_ data: [SCDataPoint], lineWidth: CGFloat, padding: CGFloat) {
        self.data = data
        self.lineWidth = lineWidth
        self.padding = padding
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(data.segments(proxy, width: lineWidth, padding: padding), id: \.id) { segment in
                    SCDonutSegmentView(segment)
                }
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Total:")
                        .font(.title.weight(.bold))
                    Text(data.totalString(with: formatter))
                        .font(.title)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.gray)
                .frame(squareSide: proxy.minSize - 2.25 * (lineWidth + padding))
            }
            .frame(width: proxy.minSize, height: proxy.minSize)
        }
    }
}

struct SCDonutSegmentsView_Previews: PreviewProvider {
    static var previews: some View {
        SCDonutSegmentsView(SCDataPoint.sampleHome, lineWidth: 80, padding: 16)
    }
}

private extension Array where Element == SCDataPoint {
    func segments(_ proxy: GeometryProxy, width: CGFloat, padding: CGFloat) -> [SCDonutSegment] {
        var from = Angle.degrees(-90)

        return map { data in
            let arc = Arc(from, from + data.delta)
            from = arc.to
            return SCDonutSegment(data, radius: proxy.minRadius, arc: arc, width: width, padding: padding)
        }
    }
}
