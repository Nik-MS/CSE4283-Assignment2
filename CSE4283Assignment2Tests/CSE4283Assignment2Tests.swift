//
//  CSE4283Assignment2Tests.swift
//  CSE4283Assignment2Tests
//
//  Created by Nikhil Menon on 2/24/21.
//

import XCTest
@testable import CSE4283Assignment2

class CSE4283Assignment2Tests: XCTestCase {
    var bmi: BodyMassIndex!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        bmi = BodyMassIndex()
    }
    
    override func tearDown() {
        super.tearDown()
        bmi = nil
    }
    
    // MARK: - Tests
    
    func testBMIFunction() {
        XCTAssertTrue(bmi.testFunction())
    }
    
}
