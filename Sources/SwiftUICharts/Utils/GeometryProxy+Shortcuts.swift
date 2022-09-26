//
//  GeometryProxy+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension GeometryProxy {
    var width: CGFloat { size.width }
    var height: CGFloat { size.height }
    var middle: CGPoint { CGPoint(x: width / 2.0, y: height / 2.0) }
    var minSize: CGFloat {
        switch (width + height == 0, width * height == 0) {
        case (true, _): return 0
        case (false, true): return max(width, height)
        default: return min(width, height)
        }
    }
    var minRadius: CGFloat { minSize / 2 }
    var centre: CGPoint { size.middle }
    var minCentre: CGPoint { CGPoint(x: minSize / 2, y: minSize / 2) }
    
    func height(in coordinateSpace: CoordinateSpace) -> CGFloat {
        frame(in: coordinateSpace).height
    }
}

internal extension CGSize {
    static func /(size: CGSize, divisor: CGFloat) -> CGSize {
        CGSize(width: size.width / divisor, height: size.height / divisor)
    }
    
    var middle: CGPoint {
        (self / 2.0).toPoint
    }
    
    private var toPoint: CGPoint {
        CGPoint(x: width, y: height)
    }
}

