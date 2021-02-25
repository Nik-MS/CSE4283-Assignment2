//
//  CSE4283Assignment2Tests.swift
//  CSE4283Assignment2Tests
//
//  Created by Nikhil Menon on 2/24/21.
//

import XCTest
@testable import CSE4283Assignment2

class CSE4283Assignment2Tests: XCTestCase {
    var bmiCalculator: BMICalculator!
    
    // MARK: - Setup
    
    // This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
        bmiCalculator = BMICalculator()
    }
    
    // This method is called after the invocation of each test method in the class.
    override func tearDown() {
        super.tearDown()
        bmiCalculator = nil
    }
    
    // MARK: - Tests
    
    func testInitialization() {
        XCTAssertNotNil(bmiCalculator)
    }
}
