//
//  Metric.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/27/21.
//

import Foundation


/// Converts an `Int` representing an Imperial measurement
/// unit value into a `Double` reperesenting the converted metric value.
@propertyWrapper struct Metric {
    private static let poundsToKilogramsMultiplier = 0.45
    private static let feetToInchesMultiplier = 12
    private static let inchesToMetersMultiplier = 0.025
    
    private(set) var conversionUnit: Unit
    
    var wrappedValue: Int = 0
    
    
    /// The metric value
    var projectedValue: Double {
        switch conversionUnit {
        case .poundsToKilograms:
            return Double(wrappedValue) * Self.poundsToKilogramsMultiplier
        case .inchesToMeters:
            return Double(wrappedValue) * Self.inchesToMetersMultiplier
        }
    }
    
    init(_ conversionUnit: Unit) {
        self.conversionUnit = conversionUnit
    }
}

// MARK: - Unit

extension Metric {
    enum Unit {
        case poundsToKilograms
        case inchesToMeters
    }
}
