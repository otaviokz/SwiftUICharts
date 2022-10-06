//
//  Path+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension Path {
    mutating func addArc(
        _ center: CGPoint,
        radius: CGFloat,
        arc: Arc,
        clockwise: Bool = false,
        transform: CGAffineTransform = .identity
    ) {
        addArc(center: center, radius: radius, startAngle: arc.from, endAngle:  arc.to, clockwise: clockwise, transform: transform)
    }
}

internal struct Arc {
    let from: Angle
    let to: Angle
    
    public init(_ from: Angle, _ to: Angle) {
        self.from = from
        self.to = to
    }
    
    public static func degrees(_ from: Double, _ to: Double) -> Arc {
        Arc(.degrees(from), .degrees(to))
    }
    
    public static func degreesTo(_ to: Double) -> Arc {
        .degrees(0, to)
    }
    
    var halfWayRad: Double { (from + to).radians / -2 }
}
