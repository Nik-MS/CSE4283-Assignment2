//
//  RetirementCalculatorTests.swift
//  CSE4283Assignment2Tests
//
//  Created by Nikhil Menon on 3/1/21.
//

import XCTest
@testable import CSE4283Assignment2

class RetirementCalculatorTests: XCTestCase {
    var retirementCalc: RetirementCalculator!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        retirementCalc = RetirementCalculator()
    }
    
    override func tearDown() {
        super.tearDown()
        retirementCalc = nil
    }
    
    // MARK: - GetTotalSavingsPerYear
    
    func testTotalSavingsPerYearWithBelowMinSalary() {
        retirementCalc.salary = 0
        retirementCalc.percentSaving = 5
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Salary is below minimum")
    }
    
    func testTotalSavingsPerYearWithMinSalary() {
        retirementCalc.salary = 1
        retirementCalc.percentSaving = 5
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 0.0675)
    }
    
    func testTotalSavingsPerYearWithNormalSalary() {
        retirementCalc.salary = 72000
        retirementCalc.percentSaving = 10
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 9720)
    }
    
    func testTotalSavingsPerYearWithMaxSalary() {
        retirementCalc.salary = 500000
        retirementCalc.percentSaving = 100
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 675000)
    }
    
    func testTotalSavingsPerYearWithOverMaxSalary() {
        retirementCalc.salary = 500001
        retirementCalc.percentSaving = 100
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Salary is above limit")
    }
    
    func testTotalSavingsPerYearWithBelowMinPercentSaved() {
        retirementCalc.salary = 20000
        retirementCalc.percentSaving = 0
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Cannot compute below 1 percent savings")
    }
    
    func testTotalSavingsPerYearWithMinPercentSaved() {
        retirementCalc.salary = 20000
        retirementCalc.percentSaving = 1
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 270)
    }
    
    func testTotalSavingsPerYearWithNormalPercentSaved() {
        retirementCalc.salary = 20000
        retirementCalc.percentSaving = 12
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 3240)
    }
    
    func testTotalSavingsPerYearWithMaxPercentSaved() {
        retirementCalc.salary = 20000
        retirementCalc.percentSaving = 100
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 27000)
    }
    
    func testTotalSavingsPerYearWithOverMaxPercentSaved() {
        retirementCalc.salary = 50000
        retirementCalc.percentSaving = 101
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Cannot save over 100%")
    }
    
    // MARK: - YearsToSavingsGoal
    
    func testYearsToSavingsGoalThrowsForInvalidGoal() {
        retirementCalc.salary = 1000
        retirementCalc.percentSaving = 5
        retirementCalc.goal = 0
        XCTAssertThrowsError(try retirementCalc.getYearsToGoal(), "Goal cannot be 0")
    }
    
    func testYearsToSavingsGoalWithMinGoal() {
        retirementCalc.salary = 1000
        retirementCalc.percentSaving = 5
        retirementCalc.goal = 1
        XCTAssertEqual(try retirementCalc.getYearsToGoal(), 1)
    }
    
    func testYearsToSavingsGoalWithNormalGoal() {
        retirementCalc.salary = 70000
        retirementCalc.percentSaving = 10
        retirementCalc.goal = 250000
        XCTAssertEqual(try retirementCalc.getYearsToGoal(), 27, "Tests for round up. Actual value is 26.46")
    }
    
    func testCalculateGoalAgeReturnsErrorForInvalidMinAge() {
        retirementCalc.configure(withAge: 0, salary: 1, percentSaved: 1, goal: 1)
        retirementCalc.calculateGoalAge { result in
            switch result {
            case .success(_):
                XCTFail("calculate with 0 age should not be successful.")
            case .failure(let error):
                switch error {
                case .invalidAge(let age):
                    XCTAssertEqual(age, 0)
                default:
                    XCTFail("Incorrect Error result")
                }
            }
        }
    }
    
    func testCalculateGoalAgeReturnsErrorForInvalidMaxAge() {
        retirementCalc.configure(withAge: 100, salary: 1, percentSaved: 1, goal: 1)
        retirementCalc.calculateGoalAge { result in
            switch result {
            case .success(_):
                XCTFail("calculate with 100 age should not be successful.")
            case .failure(let error):
                switch error {
                case .invalidAge(let age):
                    XCTAssertEqual(age, 100)
                default:
                    XCTFail("Incorrect Error result")
                }
            }
        }
    }
    
    func testCalculateGoalAgeReturnsValidAge() {
        retirementCalc.configure(withAge: 21, salary: 72000, percentSaved: 10, goal: 250000)
        retirementCalc.calculateGoalAge { result in
            switch result {
            case .success(let ageResult):
                XCTAssertEqual(ageResult, 47)
            case .failure(_):
                XCTFail("calculateGoalAge should not return a failure result")
            }
        }
    }
}
