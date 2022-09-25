//
//  Path+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

extension Path {
    typealias AnglePath = (from: Angle, to: Angle)
    
    mutating func addArc(
        _ center: CGPoint,
        radius: CGFloat,
        path: AnglePath,
        clockwise: Bool = false,
        transform: CGAffineTransform = .identity
    ) {
        addArc(center: center, radius: radius, startAngle: path.from, endAngle:  path.to, clockwise: clockwise, transform: transform)
    }
}

