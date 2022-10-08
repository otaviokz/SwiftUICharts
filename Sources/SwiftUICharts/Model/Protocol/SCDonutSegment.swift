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
    let width: CGFloat
    
    let midRadian: Double
    private var donutRadius: CGFloat = 0
    private(set) var radius: CGFloat {
        get { donutRadius }
        set { donutRadius = max(0, newValue - (width / 2) - padding) }
    }
    let xyFix: Double = 0.71
    var idString: String { "\(baseIsString)\(width)" }
    
    init(_ data: SCDataPoint, radius: CGFloat, arc: Arc, width: CGFloat, padding: CGFloat) {
        self.data = data
        self.padding = padding
        self.arc = arc
        self.width = width
        self.midRadian = arc.halfWayRad
        self.radius = radius
    }
}
