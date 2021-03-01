//
//  BodyMassIndex.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation

/// Struct that encompasses necessary methods to calculate Body Mass Index.
struct BMICalculator: Body {
    var name: String = "Body Mass Index Calculator"
    
    // MARK: - Constants
    
    private static let underWeightRange = (0 ..< 18.5)
    private static let normalWeightRange = (18.5 ... 24.9)
    private static let overWeightRange = (25 ... 29.9)
    
    private static let feetToInchesMultiplier = 12
    
    // MARK: - Properties
    
    /// Contains a `Metric` property wrapper with a `projectedValue` to retrieve the metric conversion
    /// unwrapped value represents weight in pounds.
    @Metric(.poundsToKilograms) internal var weight: Int
    /// Contains a `Metric` property wrapper with a `projectedValue` to retrieve the metric conversion
    /// unwrapped value represents weight in inches.
    @Metric(.inchesToMeters) internal var height: Int
    
    // MARK: - Conversion
    
    mutating func setWeight(inPounds lbs: Int) {
        self.weight = lbs
    }
    
    mutating func setHeight(inFeet ft: Int, inches: Int) {
        self.height = (ft * Self.feetToInchesMultiplier) + inches
    }
}

// MARK: - Error

extension BMICalculator {
    enum BMICalculatorError: Error {
        case invalidHeight(height: Int)
        case invalidWeight(weight: Int)
    }
}

// MARK: - BMI

extension BMICalculator {
    enum BMICategory: String {
        case underWeight, normalWeight, overWeight, obese
    }
    
    /// Calculates the body mass index value based on `Body` properties.
    /// - Throws: `BMICalculatorError`. Height and Weight properties are thrown in imperial units.
    /// - Returns:  A double rounded to the nearest tenth.
    @discardableResult
    internal func calculateBMI() throws -> Double {
        guard $weight > 0 else {
            throw BMICalculatorError.invalidWeight(weight: weight)
        }
        
        guard $height > 0 else {
            throw BMICalculatorError.invalidHeight(height: height)
        }
        
        // Divide weight by the squared height
        let exactBMI = $weight / pow($height, 2)
        // Format value to nearest decimal tenth
        return exactBMI.roundDecimal(.nearestTenth)
    }
    
    
    /// Evaluates the Body Mass Index value to a BMI category
    /// - Throws: `BMICalculatorError` if the `calculateBMI()` call fails.
    /// - Returns: `BMICategory`
    func evaluateBMI() throws -> BMICategory {
        
        let bmi = try calculateBMI()
        
        if Self.underWeightRange.contains(bmi) {
            return .underWeight
        } else if Self.normalWeightRange.contains(bmi) {
            return .normalWeight
        } else if Self.overWeightRange.contains(bmi) {
            return .overWeight
        } else {
            return .obese
        }
    }
}
