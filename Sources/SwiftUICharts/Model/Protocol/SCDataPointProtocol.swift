//
//  SCDataPointProtocol.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import SwiftUI

public protocol SCDataPointProtocol: Identifiable {
    var title: String { get }
    var value: Double { get }
    var color: Color { get }
    var idString: String { get }
    
    func valueString(with formatter: NumberFormatter?) -> String
}

public extension SCDataPointProtocol {
    var idString: String { "\(title)\(value)\(color)" }
    var id: ObjectIdentifier { idString.asObjectIdentifier }

    func valueString(with formatter: NumberFormatter? = nil) -> String {
        formatter?.string(for: value) ?? String(format: "%.1f", value)
    }
}

public extension Array where Element: SCDataPointProtocol {
    var totaling: Double {
        reduce(into: 0.0) { $0 += $1.value }
    }
    
    func totalString(with formatter: NumberFormatter? = nil) -> String {
        formatter?.string(for: totaling) ?? String(format: "%.1f", totaling)
    }
    
    func sorted(descending: Bool = true) -> Self {
        sorted(by: descending ? { $0.value > $1.value } : { $0.value < $1.value })
    }
}
