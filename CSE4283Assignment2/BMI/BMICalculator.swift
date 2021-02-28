//
//  BodyMassIndex.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation

/// Struct that encompasses necessary methods to calculate Body Mass Index.
struct BMICalculator: Body {
    
    // MARK: - Constants
    
    static let poundsToKilogramsMultiplier = 0.45
    static let feetToInchesMultiplier = 12
    static let inchesToMetersMultiplier = 0.025
    
    // MARK: - Properties
    
    
    /// Contains a `Metric` property wrapper with a `projectedValue` to retrieve the metric conversion
    /// unwrapped value represents weight in pounds.
    @Metric(.poundsToKilograms) var weight: Int
    /// Contains a `Metric` property wrapper with a `projectedValue` to retrieve the metric conversion
    /// unwrapped value represents weight in inches.
    @Metric(.inchesToMeters) var height: Int
    
    // MARK: - Conversion
    
    mutating func setWeight(inPounds lbs: Int) {
        self.weight = lbs
    }
    
    mutating func setHeight(inFeet ft: Int, inches: Int) {
        self.height = (ft * 12) + inches
    }
}

// MARK: - Calculator

extension BMICalculator: Calculator {
    
    /// Calculates the body mass index value based on `Body` properties.
    /// - Returns: A double rounded to the nearest tenth.
    @discardableResult
    func calculate() -> Double {
        // Divide weight by the squared height
        let exactBMI = $weight / pow($height, 2)
        // Format value to nearest decimal tenth
        return exactBMI.roundDecimal(.nearestTenth)
    }
}
