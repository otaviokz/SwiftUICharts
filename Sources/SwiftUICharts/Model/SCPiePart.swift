//
//  SCPiePart.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

internal struct SCPiePart: SCCircleChartPart {
    let data: SCDataPoint
    let padding: CGFloat
    let arc: Arc
    let midRadian: Double
    let radius: CGFloat
    let xyFix: Double = 0.71
    var idString: String { baseIdString }
    
    init(_ data: SCDataPoint, radius: CGFloat, arc: Arc, padding: CGFloat) {
        self.data = data
        self.arc = arc
        self.padding = padding
        self.midRadian = arc.halfWayRad
        self.radius = max(0, radius - padding)
    }
}
