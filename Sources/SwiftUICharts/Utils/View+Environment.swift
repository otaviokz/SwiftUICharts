//
//  View+Environment.swift
//  
//
//  Created by Otávio Zabaleta on 26/09/2022.
//

import SwiftUI

private struct NumberFormatterEnvironmentKey: EnvironmentKey {
    static let defaultValue: NumberFormatter = .intgerValues
}

public extension EnvironmentValues {
    var numberFormatter: NumberFormatter {
        get { self[NumberFormatterEnvironmentKey.self] }
        set { self[NumberFormatterEnvironmentKey.self] = newValue }
    }
}
