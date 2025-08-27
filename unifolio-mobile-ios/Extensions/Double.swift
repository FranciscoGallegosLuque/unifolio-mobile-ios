//
//  Double.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 27/08/2025.
//

import Foundation

extension Double {
    /// Converts a Double into a Peso Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyPesoFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- default value
        formatter.currencyCode = "ars" // <- change currency
        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Peso Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asPesoCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyPesoFormatter2.string(from: number) ?? "$0.00"
    }
}
