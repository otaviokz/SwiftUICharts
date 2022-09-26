//
//  View+Shortcuts.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension View {
    @inlinable func frame(squareSide: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: squareSide, height: squareSide, alignment: alignment)
    }
}

