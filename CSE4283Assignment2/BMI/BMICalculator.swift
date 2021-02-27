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
    
    var weight: Int!
    var height: Int!
    
    var metricWeight: Double {
        guard let weight = weight else {
            fatalError("weight has not been set")
        }
        
        return Double(weight) * Self.poundsToKilogramsMultiplier
    }
    
    var metricHeight: Double {
        return Double(height) * Self.inchesToMetersMultiplier
    }
    
    // MARK: - Conversion
    
    mutating func setWeight(inPounds lbs: Int) {
        self.weight = lbs
    }
    
    mutating func setHeight(inFeet ft: Int, inches: Int) {
        self.height = (ft * 12) + inches
    }
}
