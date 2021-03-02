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
    
    func testSuccessfulGetTotalSavingsPerYear() {
        // Minimum
        retirementCalc.configure(withAge: 21, salary: 0, percentSaved: 1, goal: 1000000)
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Cannot have 0 salary")
        
        // Normal
        retirementCalc.configure(withAge: 21, salary: 72000, percentSaved: 10, goal: 1000000)
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 9720)
        
        // Max
        retirementCalc.configure(withAge: 21, salary: 500000, percentSaved: 100, goal: 1000000)
        XCTAssertEqual(try retirementCalc.getTotalAnnualSavings(), 675000)
    }
    
    func testGetTotalSavingsPerYearThrowsError() {
        // Below Minimum
        retirementCalc.configure(withAge: 21, salary: -1, percentSaved: 1, goal: 1000000)
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Salary is below minimum")
        
        retirementCalc.configure(withAge: 21, salary: 20000, percentSaved: 0, goal: 1000000)
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Cannot compute below 1 percent savings")
        
        // Over Max
        retirementCalc.configure(withAge: 21, salary: 500001, percentSaved: 100, goal: 1000000)
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Salary is above limit")
        
        retirementCalc.configure(withAge: 21, salary: 500001, percentSaved: 101, goal: 1000000)
        XCTAssertThrowsError(try retirementCalc.getTotalAnnualSavings(), "Cannot save over 100%")
    }
    
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
