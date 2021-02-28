//
//  CSE4283Assignment2Tests.swift
//  CSE4283Assignment2Tests
//
//  Created by Nikhil Menon on 2/24/21.
//

import XCTest
@testable import CSE4283Assignment2

class BMICalculatorTests: XCTestCase {
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
    
    func testConversionFromPoundsToKilograms() {
        bmiCalculator.setWeight(inPounds: 120)
        XCTAssertEqual(bmiCalculator.weight, 120)
        XCTAssertEqual(bmiCalculator.$weight, 54)
        
        bmiCalculator.setWeight(inPounds: 1)
        XCTAssertEqual(bmiCalculator.weight, 1)
        XCTAssertEqual(bmiCalculator.$weight, 0.45)
        
        bmiCalculator.setWeight(inPounds: 131)
        XCTAssertEqual(bmiCalculator.weight, 131)
        XCTAssertEqual(bmiCalculator.$weight, 58.95)
    }
    
    func testConversionFromHeightToMeters() {
        bmiCalculator.setHeight(inFeet: 5, inches: 5)
        XCTAssertEqual(bmiCalculator.height, 65)
        XCTAssertEqual(bmiCalculator.$height, 1.625)
        
        bmiCalculator.setHeight(inFeet: 0, inches: 5)
        XCTAssertEqual(bmiCalculator.height, 5)
        XCTAssertEqual(bmiCalculator.$height, 0.125)
        
        bmiCalculator.setHeight(inFeet: 6, inches: 3)
        XCTAssertEqual(bmiCalculator.height, 75)
        XCTAssertEqual(bmiCalculator.$height, 1.875)
    }
    
    func testCalculate() {
        bmiCalculator.setWeight(inPounds: 120)
        bmiCalculator.setHeight(inFeet:5, inches: 5)
        XCTAssertEqual(bmiCalculator.calculate(), 20.4)
        
        bmiCalculator.setWeight(inPounds: 177)
        bmiCalculator.setHeight(inFeet: 4, inches: 8)
        XCTAssertEqual(bmiCalculator.calculate(), 40.6)
        
        // Example from: http://extoxnet.orst.edu/faqs/dietcancer/web2/twohowto.html
        bmiCalculator.setWeight(inPounds: 125)
        bmiCalculator.setHeight(inFeet: 5, inches: 3)
        XCTAssertEqual(bmiCalculator.calculate(), 22.7)
    }
    
//    func testUnderWeight() {
//        bmiCalculator.setWeight(inPounds: 99)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.underweight)
//    }
    
//    func testNormalWeight() {
//        bmiCalculator.setWeight(inPounds: 120)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.normal)
//    }
    
//    func testOverWeight() {
//        bmiCalculator.setWeight(inPounds: 165)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.overweight)
//    }
    
//    func testObeseWeight() {
//        bmiCalculator.setWeight(inPounds: 220)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.overweight)
//    }
    
}
