//
//  CGPoint+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 25/09/2022.
//

import SwiftUI

internal extension CGPoint {
    static func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(lhs.x * rhs.x, lhs.y * rhs.y)
    }
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
}
