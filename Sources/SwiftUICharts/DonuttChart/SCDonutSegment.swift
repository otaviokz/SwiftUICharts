//
//  SCDonutSegment.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

protocol SCChartSegment {
    associatedtype DataPoint: SCDataPointProtocol
    
    var dataPoint: DataPoint { get }
    var name: String { get }
    var value: Double { get }
    var color: Color { get }
}

extension SCChartSegment {
    var name: String { dataPoint.title }
    var value: Double { dataPoint.value }
    var color: Color { dataPoint.color }
}

struct SCDonutSegment: SCChartSegment {
    let dataPoint: SCDataPoint
    private let padding: CGFloat
    let width: CGFloat
    let path: Path.AnglePath
    private let arcRad: Double
    private var donutRadius: CGFloat = 0
    var radius: CGFloat {
        get { donutRadius }
        set { donutRadius = max(0, newValue - (width / 2) - padding) }
    }
    
    init(
        _ dataPoint: SCDataPoint,
        radius: CGFloat,
        path: Path.AnglePath,
        width: CGFloat,
        padding: CGFloat
    ) {
        self.dataPoint = dataPoint
        self.width = width
        self.path = path
        self.padding = padding
        self.arcRad = (path.from + path.to).radians / -2
        self.radius = radius
    }
    
    func labelPosition(from centre: CGPoint) -> CGPoint {
        centre * CGPoint(x: 1 + 0.71 * cos(arcRad), y: 1 - 0.71 * sin(arcRad))
    }
}

extension SCDonutSegment: Identifiable {
    var idString: String { "\(dataPoint.id.hashValue)\(width)\(padding)\(arcRad)" }
    
    var id: ObjectIdentifier {
        ObjectIdentifier(NSString(string: idString))
    }
}

private extension CGPoint {
    static func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
}
