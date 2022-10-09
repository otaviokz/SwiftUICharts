//
//  Path+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension Path {
    mutating func addArc(_ center: CGPoint, radius: CGFloat, arc: Arc, clockwise: Bool = false) {
        addArc(center: center, radius: radius, startAngle: arc.from, endAngle: arc.to, clockwise: clockwise)
    }
}

internal struct Arc {
    let from: Angle
    let to: Angle
    
    var halfWayRad: Double { (from + to).radians / -2 }
    
    public init(_ from: Angle, _ to: Angle) {
        self.from = from
        self.to = to
    }
    
    public static func degrees(_ from: Double, _ to: Double) -> Arc {
        Arc(.degrees(from), .degrees(to))
    }
}
