//
//  Color+Hex.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

internal extension Color {
    init?(hex: String) {
        var hexOnly = hex.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "#", with: "")
        if hexOnly.count == 6 { hexOnly += "ff" }
        guard hexOnly.count == 8 else { return nil }
        
        var rgb: UInt64 = 0
        guard Scanner(string: hexOnly).scanHexInt64(&rgb) else { return nil }

        let r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
        let g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
        let b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
        let a = CGFloat(rgb & 0x000000FF) / 255.0

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}

internal extension Array where Element == Color {
    init(hex: String...) {
        self.init(hex.compactMap { Color(hex: $0) })
    }
}
