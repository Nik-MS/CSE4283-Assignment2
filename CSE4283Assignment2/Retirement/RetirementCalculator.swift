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
    private static let validAgeRange = (1 ... 100)
    
    // MARK: - Methods
    
    mutating func configure(withAge age: Int, salary: Int, percentSaved: Int, goal: Int) {
        self.age = age
        self.salary = salary
        self.percentSaving = percentSaved
        self.goal = goal
    }
    
    internal func getTotalAnnualSavings() throws -> Double {
        guard Self.validSalaryRange.contains(salary) else {
            throw RetirementError.invalidSalary(salary: salary)
        }
        
        guard Self.validPercentageRange.contains(percentSaving) else {
            throw RetirementError.invalidSavingsPercentage(percentage: percentSaving)
        }
        
        return (Double(salary) * $percentSaving) * Self.employerMatchMultiplier
    }
    
    internal func getYearsToGoal() throws -> Int {
        guard goal > 0 else {
            throw RetirementError.invalidGoal(goal: goal)
        }
        
        let savingsPerYear = try getTotalAnnualSavings()
        return Int((Double(goal) / savingsPerYear).rounded(.up))
    }
    
    typealias GoalAgeCompletionResult = (Result<Int, RetirementError>) -> Void
    func calculateGoalAge(_ completion: GoalAgeCompletionResult) {
        guard Self.validAgeRange.contains(age) else {
            completion(.failure(.invalidAge(age: age)))
            return
        }
        
        var yearsToGoal: Int
        
        do {
            yearsToGoal = try getYearsToGoal()
        } catch let error {
            if let error = error as? RetirementError {
                completion(.failure(error))
                return
            } else {
                fatalError("Unexpected Error in RetirementCalculator.calculateGoalAge(): \(error)")
            }
        }
        
        let ageAtGoal = yearsToGoal + age
        completion(.success(ageAtGoal))
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
