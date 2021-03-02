//
//  RetirementError+LocalizedError.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 3/2/21.
//

import Foundation

extension RetirementCalculator.RetirementError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidSalary(let salary):
            return "The salary you entered (\(salary)) is invalid. Please try again"
        case .invalidSavingsPercentage(let percentage):
            return "The percent at which you saved (\(percentage)%) is invalid. Please try again."
        case .invalidGoal(let goal):
            return "The percent at which you saved (\(goal)%) is invalid. Please try again."
        case .invalidAge(let age):
            return "The age you entered (\(age)) is invalid. Please try again."
        }
    }
}
