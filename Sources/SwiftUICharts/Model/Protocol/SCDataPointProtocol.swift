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
 
    func valueString(with formatter: NumberFormatter?) -> String
}


public extension SCDataPointProtocol {
    var devaulfValueString: String {
        String(format: "%.1f", value)
    }
    
    func valueString(with formatter: NumberFormatter? = nil) -> String {
        formatter?.string(for: value) ?? devaulfValueString
    }
}

extension SCDataPointProtocol {
    public var id: ObjectIdentifier {
        ObjectIdentifier(NSString(string: "\(title)\(value)\(color)"))
    }
}

public extension Array where Element: SCDataPointProtocol {
    var totaling: Double {
        reduce(into: 0.0) { $0 += $1.value }
    }
    
    var defaultTotalString: String {
        String(format: "%.1f", totaling)
    }
    
    func totalString(with formatter: NumberFormatter? = nil) -> String {
        formatter?.string(for: totaling) ?? defaultTotalString
    }
    
    func sorted(descending: Bool = true) -> Self {
        sorted(by: descending ? { $0.value > $1.value } : { $0.value < $1.value })
    }
}
