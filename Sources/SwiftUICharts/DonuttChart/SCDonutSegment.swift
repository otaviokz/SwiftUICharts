//
//  SCDonutSegment.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

struct SCDonutSegment: SCCircleChartPart {
    let data: SCDataPoint
    private let padding: CGFloat
    let width: CGFloat
    let arc: Arc
    let arcRad: Double
    private var donutRadius: CGFloat = 0
    private(set) var arcRadius: CGFloat {
        get { donutRadius }
        set { donutRadius = max(0, newValue - (width / 2) - padding) }
    }
    let arcFraction: Double = 0.71
    var idString: String { "\(data.id.hashValue)\(width)\(padding)\(arcRad)" }
    
    init(_ data: SCDataPoint, radius: CGFloat, arc: Arc, width: CGFloat, padding: CGFloat) {
        self.data = data
        self.width = width
        self.arc = arc
        self.padding = padding
        self.arcRad = arc.halfPathRadians
        self.arcRadius = radius
    }
}
