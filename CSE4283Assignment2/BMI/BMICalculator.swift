//
//  BodyMassIndex.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation
import ArgumentParser

protocol Calculator {
    func calculate() -> Double
}

protocol Body {
    var weight: Double! { get set }
    var height: Double! { get set }
}

/// Struct that encompasses necessary methods to calculate Body Mass Index.
struct BMICalculator: Calculator, Body {
    static let weightConversionConstant = 0.45
    
    // MARK: - Properties
    
    var weight: Double!
    var height: Double!
    
    var metricWeight: Double {
        guard let weight = weight else {
            fatalError("weight has not been set")
        }
        
        return weight * Self.weightConversionConstant
    }
    
    // MARK: - Conversion
    
    mutating func setWeight(inPounds lbs: Double) {
        self.weight = lbs
    }
    
    
    
    
    func calculate() -> Double {
        return 0
    }
}
