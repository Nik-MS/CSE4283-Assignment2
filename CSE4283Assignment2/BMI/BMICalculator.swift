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
    
    /// Conversion multiplier to convert from imperial Pounds (lbs). to metric meters (m).
    static let poundsToKilogramsMultiplier = 0.45
    
    // MARK: - Properties
    
    var weight: Int!
    var height: Int!
    
    var metricWeight: Double {
        guard let weight = weight else {
            fatalError("weight has not been set")
        }
        
        return Double(weight) * Self.poundsToKilogramsMultiplier
    }
    
    // MARK: - Conversion
    
    mutating func setWeight(inPounds lbs: Int) {
        self.weight = lbs
    }
}
