//
//  SCPieSlice.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

struct SCPieSlice: SCCircleChartPart {
    let data: SCDataPoint
    private let padding: CGFloat
    let arc: Arc
    let arcRad: Double
    private var sliceRadius: CGFloat = 0
    private(set) var arcRadius: CGFloat {
        get { sliceRadius }
        set { sliceRadius = max(0, newValue - padding) }
    }
    let arcFraction: Double = 0.875
    var idString: String { "\(data.id.hashValue)\(padding)\(arcRad)" }
    
    init(_ data: SCDataPoint, radius: CGFloat, arc: Arc, padding: CGFloat) {
        self.data = data
        self.arc = arc
        self.padding = padding
        self.arcRad = arc.halfPathRadians
        self.arcRadius = radius
    }
}
