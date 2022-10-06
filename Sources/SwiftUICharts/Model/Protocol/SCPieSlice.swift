//
//  SCPieSlice.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

internal struct SCPieSlice: SCCircleChartPart {
    let data: SCDataPoint
    private let padding: CGFloat
    let arc: Arc
    let midRadian: Double
    private var sliceRadius: CGFloat = 0
    private(set) var radius: CGFloat {
        get { sliceRadius }
        set { sliceRadius = max(0, newValue - padding) }
    }
    let xyFix: Double = 0.875
    var idString: String { "\(data.idString)\(padding)\(midRadian)" }
    
    init(_ data: SCDataPoint, radius: CGFloat, arc: Arc, padding: CGFloat) {
        self.data = data
        self.arc = arc
        self.padding = padding
        self.midRadian = arc.halfWayRad
        self.radius = radius
    }
}
