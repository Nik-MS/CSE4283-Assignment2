//
//  Percentage.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 3/1/21.
//

import Foundation

/// Property wrapped that converts an `Int` into `Double` that represents the decimal representation of a percentage.
/// - Example: Setting a `Percentage` property to 12 will have a projected `Double` value of 0.12
@propertyWrapper struct Percentage {
    var wrappedValue: Int
    
    var projectedValue: Double {
        return Double(wrappedValue) / 100
    }
}
