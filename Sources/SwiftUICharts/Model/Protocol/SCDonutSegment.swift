//
//  SCDonutSegment.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal struct SCDonutSegment: SCCircleChartPart {
    let data: SCDataPoint
    let padding: CGFloat
    let arc: Arc
    let weight: CGFloat
    let midRadian: Double
    let radius: CGFloat
    let xyFix: Double = 0.71
    var idString: String { "\(baseIdString)\(weight)" }
    
    init(_ data: SCDataPoint, radius: CGFloat, arc: Arc, weight: CGFloat, padding: CGFloat) {
        self.data = data
        self.padding = padding
        self.arc = arc
        self.weight = weight
        self.midRadian = arc.halfWayRad
        self.radius = max(0, radius - (weight / 2) - padding)
    }
}
