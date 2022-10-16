//
//  GeometryProxy+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension GeometryProxy {
    private var w: CGFloat { size.width }
    private var h: CGFloat { size.height }
    var minSize: CGFloat { w * h == 0 ? max(w, h) : min(w, h) }
    var minSizeRadius: CGFloat { minSize / 2 }
    var centre: CGPoint { CGPoint(w, h) / 2 }
    var minSizeCentre: CGPoint { CGPoint(xy: minSize / 2) }
}
