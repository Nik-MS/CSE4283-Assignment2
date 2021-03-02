//
//  BMICalculator+Interface.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/28/21.
//

import Foundation

extension BMICalculator: Interface {
    mutating func run() {
        LC.header(name)
        
        let heightFeet = LC.promptForInt("Input height in feet")
        let heightInches = LC.promptForInt("Input remaining height in inches")
        let weightPounds = LC.promptForInt("Input weight in pounds")
        
        // Run Calculations
        self.setHeight(inFeet: heightFeet, inches: heightInches)
        self.setWeight(inPounds: weightPounds)
        
        do {
            let bmi = try calculateBMI()
            let resultCategory = try evaluateBMI()
            LC.notice("You are considered \(resultCategory.rawValue) with a BMI of \(bmi)")
        } catch let error {
            if let error = error as? BMICalculatorError {
                switch error {
                case let .invalidHeight(height):
                    LC.error("The height you entered, \(height) cannot be used to calculate your BMI.")
                    return
                case let .invalidWeight(weight):
                    LC.error("The weight you entered, \(weight) cannot be used to calculate your BMI.")
                    return
                }
            }
        }
    }
}
