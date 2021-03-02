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
    @Percentage var percentSaving: Double = 0
    
    // MARK: - Constants
    
    static let employerMatchMultiplier: Double = 1.35
    
    // MARK: - Methods
    
    mutating func configure(withAge age: Int, salary: Int, percentSaved: Double, goal: Int) {
        self.age = age
        self.salary = salary
        self.percentSaving = percentSaved
        self.goal = goal
    }
    
    func getTotalAnnualSavings() throws -> Double {
        
        guard salary > 0, salary <= 500000 else {
            throw RetirementError.invalidSalary(salary: salary)
        }
        
        guard percentSaving > 0, percentSaving <= 1.0 else {
            throw RetirementError.invalidSavingsPercentage(percentage: percentSaving)
        }
        
        return (Double(salary) * percentSaving) * Self.employerMatchMultiplier
    }
}

// MARK: - Error

extension RetirementCalculator {
    enum RetirementError: Error {
        case invalidSalary(salary: Int)
        case invalidSavingsPercentage(percentage: Double)
        case invalidGoal(goal: Int)
        case invalidAge(age: Int)
    }
}
