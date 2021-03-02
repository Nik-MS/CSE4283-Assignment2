//
//  Retirement.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation

struct RetirementCalculator {
    
    // MARK: - Properties
    
    var age: Int!
    var salary: Int!
    var goal: Int!
    @Percentage var percentSaving = 0
    
    // MARK: - Constants
    
    private static let employerMatchMultiplier: Double = 1.35
    private static let validSalaryRange = (1 ... 500000)
    private static let validPercentageRange = (1 ... 100)
    
    // MARK: - Methods
    
    mutating func configure(withAge age: Int, salary: Int, percentSaved: Int, goal: Int) {
        self.age = age
        self.salary = salary
        self.percentSaving = percentSaved
        self.goal = goal
    }
    
    func getTotalAnnualSavings() throws -> Double {
        guard Self.validSalaryRange.contains(salary) else {
            throw RetirementError.invalidSalary(salary: salary)
        }
        
        guard Self.validPercentageRange.contains(percentSaving) else {
            throw RetirementError.invalidSavingsPercentage(percentage: percentSaving)
        }
        
        return (Double(salary) * $percentSaving) * Self.employerMatchMultiplier
    }
}

// MARK: - Error

extension RetirementCalculator {
    enum RetirementError: Error {
        case invalidSalary(salary: Int)
        case invalidSavingsPercentage(percentage: Int)
        case invalidGoal(goal: Int)
        case invalidAge(age: Int)
    }
}
