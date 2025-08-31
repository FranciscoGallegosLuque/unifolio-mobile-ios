//
//  Double.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 27/08/2025.
//

import Foundation

extension Double {
    /// Converts a Double into a Currency with 2 decimal places. Receives the currency code and symbol.
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private func currencyFormatter2(code: String, symbol: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- default value
        formatter.currencyCode = code // <- change currency
        formatter.currencySymbol = symbol // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.paddingPosition = .afterPrefix
        return formatter
    }
    
    /// Converts a Double into a Peso Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$ 1,234.56"
    /// ```
    func asPesoCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2(code: "ars", symbol: "$").string(from: number) ?? "$ 0.00"
    }
    
    /// Converts a Double into a Dollar Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "US$ 1,234.56"
    /// ```
    func asDollarCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2(code: "usd", symbol: "US$").string(from: number) ?? "US$ 0.00"
    }
    
    /// Converts a Double into a Currency without decimal places (applies the floor function).
    /// ```
    /// Convert 1234.56 to $1,234
    /// ```
    private func currencyFormatter0(code: String, symbol: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- default value
        formatter.currencyCode = code // <- change currency
        formatter.currencySymbol = symbol // <- change currency symbol
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        formatter.paddingPosition = .afterPrefix
        return formatter
    }
    
    /// Converts a Double into a Peso Currency as a String without decimal places
    /// ```
    /// Convert 1234.56 to "$ 1,234"
    /// ```
    func asPesoCurrencyWithoutDecimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter0(code: "ars", symbol: "$").string(from: number) ?? "$ 0"
    }
    
    /// Converts a Double into a Dollar Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "US$ 1,234.56"
    /// ```
    func asDollarCurrencyWithoutDecimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter0(code: "usd", symbol: "US$").string(from: number) ?? "US$ 0"
    }
    
    /// Converts a Double into a Double with a comma as decimal separator and with 2 decimals.
    /// ```
    /// Convert 1234.56209 to 1234,56
    /// Convert 1234.000 to 1234,00
    /// `
    private func numberFormatter(decimals: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = decimals
        formatter.maximumFractionDigits = decimals
        return formatter
    }
    
    /// Converts a Double into a String representation without decimals.
    /// ```
    /// Convert 1.23456 to "1,23"
    /// ```
    func asNumberStringWithoutDecimals() -> String {
        let number = NSNumber(value: self)
        return numberFormatter(decimals: 0).string(from: number) ?? "0"
    }
    
    /// Converts a Double into a String representation with 2 decimals.
    /// ```
    /// Convert 1.23456 to "1,23"
    /// ```
    func asNumberStringWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return numberFormatter(decimals: 2).string(from: number) ?? "0,00"
    }
    
    /// Converts a Double into a String representation.
    /// ```
    /// Convert 1.23456 to "1.23"
    /// ```
    func asFirst2Decimals() -> String {
        let number = NSNumber(value: self)
        let first2Decimals = numberFormatter(decimals: 2).string(from: number)?.suffix(2) ?? Substring(stringLiteral: "00")
        return String(first2Decimals)
    }
    
    /// Converts a Double into a String representation with percent symbol.
    /// ```
    /// Convert 1.23456 to "1.23%"
    /// ```
    func asPercentString() -> String {
        let number = NSNumber(value: self)
        let doubleWith2Decimals = numberFormatter(decimals: 2).string(from: number) ?? "0,00"
        return String(doubleWith2Decimals) + "%"
    }
    
    
    
    
    
}
