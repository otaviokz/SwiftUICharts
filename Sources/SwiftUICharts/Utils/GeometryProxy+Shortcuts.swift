//
//  GeometryProxy+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension GeometryProxy {
    var w: CGFloat { size.width }
    var h: CGFloat { size.height }
    var minSide: CGFloat { w * h == 0 ? max(w, h) : min(w, h) }
    var minRadius: CGFloat { minSide / 2 }
    var centre: CGPoint { CGPoint(w, h) / 2 }
    var minSideCentre: CGPoint { CGPoint(xy: minSide / 2) }
}
