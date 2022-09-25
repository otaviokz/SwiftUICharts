//
//  GeometryProxy+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

public extension GeometryProxy {
    var width: CGFloat { size.width }
    var hRadius: CGFloat { width / 2 }
    var height: CGFloat { size.height }
    var middle: CGPoint { CGPoint(x: width / 2.0, y: height / 2.0) }
    var middleX: CGFloat { middle.x }
    var middleY: CGFloat { middle.y }
    var minSize: CGFloat {
        switch (width + height == 0, width * height == 0) {
        case (true, true): return 0
        case (false, true): return max(width, height)
        default: return min(width, height)
        }
    }
    var minRadius: CGFloat { minSize / 2 }
    var maxSize: CGFloat { max(width, height) }
    var aspectRatio: (CGFloat) { (maxSize / minSize) }
    var centre: CGPoint { size.middle }
    var minCentre: CGPoint { CGPoint(x: minSize / 2, y: minSize / 2) }
    
    
    func height(in coordinateSpace: CoordinateSpace) -> CGFloat {
        frame(in: coordinateSpace).height
    }
    
    func width(in coordinateSpace: CoordinateSpace) -> CGFloat {
        frame(in: coordinateSpace).width
    }
}

private extension CGSize {
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

