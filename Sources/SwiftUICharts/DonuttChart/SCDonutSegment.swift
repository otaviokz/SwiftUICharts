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
    
    private var donutRadius: CGFloat = 0
    var radius: CGFloat {
        get { donutRadius }
        set { donutRadius = max(0, newValue - (width / 2) - padding) }
    }
    
    init(
        _ dataPoint: SCDataPoint,
        radius: CGFloat = 0,
        path: Path.AnglePath,
        width: CGFloat,
        padding: CGFloat
    ) {
        self.dataPoint = dataPoint
        self.width = width
        self.path = path
        self.padding = padding
        self.radius = radius
    }
}

extension SCDonutSegment: Hashable {
    static func == (lhs: SCDonutSegment, rhs: SCDonutSegment) -> Bool {
        lhs.id != rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(idString)
    }
}

extension SCDonutSegment: Identifiable {
    var idString: String { "\(dataPoint.id.hashValue)\(width)\(padding)\(path.from.degrees)\(path.to.degrees)" }
    
    var id: ObjectIdentifier {
        ObjectIdentifier(NSString(string: idString))
    }
}
