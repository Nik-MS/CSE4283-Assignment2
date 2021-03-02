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
    
    func testYearsToSavingsGoal() {
        retirementCalc.configure(withAge: 21, salary: 10000, percentSaved: 5, goal: 0)
        XCTAssertThrowsError(try retirementCalc.getYearsToGoal(), "Goal cannot be 0")
        
        retirementCalc.configure(withAge: 21, salary: 0, percentSaved: 5, goal: 1000)
        XCTAssertThrowsError(try retirementCalc.getYearsToGoal(), "Salary is 0, error is thrown.")
        
        retirementCalc.configure(withAge: 21, salary: 72000, percentSaved: 10, goal: 1000000)
        XCTAssertEqual(try retirementCalc.getYearsToGoal(), 103) // Tests for rounding up (actual value is 102.8)
    }
    
//    func testCalculateAgeToGoal() {
//
//    }
}
