//
//  SCDonutSegmentsView.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

import SwiftUI

struct SCDonutSegmentsView: View {
    private let dataPoints: [SCDataPoint]
    private let lineWidth: CGFloat
    private let padding: CGFloat
    private let formatter: NumberFormatter?
    
    init(
        _ dataPoints: [SCDataPoint],
        lineWidth: CGFloat,
        padding: CGFloat,
        formatter: NumberFormatter? = nil
    ) {
        self.dataPoints = dataPoints
        self.lineWidth = lineWidth
        self.padding = padding
        self.formatter = formatter
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(dataPoints.asDonutSegments(proxy.minRadius, width: lineWidth, padding: padding), id: \.id) { segment in
                    Path { path in
                        path.addArc(proxy.minCentre, radius: segment.radius, path: segment.path)
                    }
                    .stroke(segment.color, lineWidth: segment.width)
                }
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Total:")
                        .font(.title.weight(.bold))
                    Text(dataPoints.totalString(with: formatter))
                        .font(.title)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.gray)
                .frame(squareSide: proxy.width - 2.25 * (lineWidth + padding))
            }
            .frame(width: proxy.width, height: proxy.width)
        }
    }
}

struct SCDonutSegmentsView_Previews: PreviewProvider {
    static var previews: some View {
        SCDonutSegmentsView(SCDataPoint.sampleHome, lineWidth: 80, padding: 16)
    }
}

private extension Array where Element == SCDataPoint {
    func asDonutSegments(_ radius: CGFloat, width: CGFloat, padding: CGFloat) -> [SCDonutSegment] {
        guard !isEmpty else { return [] }
        var startAngle = Angle.degrees(-90)
        
        return map { data in
            let endAngle = startAngle + data.delta
            let path = (startAngle, endAngle)
            startAngle = endAngle
        
            return SCDonutSegment(data, radius: radius, path: path, width: width, padding: padding)
        }
    }
}
