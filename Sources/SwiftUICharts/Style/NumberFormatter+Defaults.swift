//
//  NumberFormatter+Defaults.swift
//  
//
//  Created by Otávio Zabaleta on 24/09/2022.
//

import Foundation

public extension NumberFormatter {
    private static var currency: NumberFormatter {
        let formatter = NumberFormatter().fraction()
        formatter.numberStyle = .currency
        return formatter
    }
    
    private func currencyCode(_ code: String = "USD") -> NumberFormatter {
        currencyCode = code
        return self
    }
    
    static func currency(_ code: String = "USD") -> NumberFormatter {
        .currency.grouping().fraction().currencyCode(code)
    }
    
    static var usd: NumberFormatter {
        .currency("USD")
    }
    
    static var gbp: NumberFormatter {
        .currency("GBP")
    }
    
    static var percent: NumberFormatter {
        let formatter = NumberFormatter().fraction(maxDigits: 1)
        formatter.numberStyle = .percent
        formatter.percentSymbol = "\u{fe6a}"
        return formatter
    }
    
    @inlinable func grouping(_ separator: String = ",", size: Int = 3) -> NumberFormatter {
        usesGroupingSeparator = true
        groupingSeparator = separator
        groupingSize = size
        return self
    }
    
    @inlinable func fraction(minDigits: Int = 0, maxDigits: Int = 2, separator: String = ".") -> NumberFormatter {
        minimumFractionDigits = minDigits
        maximumFractionDigits = maxDigits
        decimalSeparator = separator
        return self
    }
    
    @inlinable func fixedFraction(_ separator: String = ".", digits: Int = 1) -> NumberFormatter {
        minimumFractionDigits = digits
        maximumFractionDigits = digits
        decimalSeparator = separator
        return self
    }
    
    @inlinable func noFraction() -> NumberFormatter {
        fixedFraction(digits: 0)
    }
    
    static var intgerValues: NumberFormatter {
        NumberFormatter().noFraction().grouping()
    }
}
