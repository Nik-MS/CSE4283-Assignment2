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
        XCTAssertEqual(bmiCalculator.metricWeight, 54)
        
        bmiCalculator.setWeight(inPounds: 1)
        XCTAssertEqual(bmiCalculator.weight, 1)
        XCTAssertEqual(bmiCalculator.metricWeight, 0.45)
        
        bmiCalculator.setWeight(inPounds: 131)
        XCTAssertEqual(bmiCalculator.weight, 131)
        XCTAssertEqual(bmiCalculator.metricWeight, 58.95)
    }
    
    func testConversionFromHeightToMeters() {
        bmiCalculator.setHeight(inFeet: 5, inches: 5)
        XCTAssertEqual(bmiCalculator.height, 65)
        XCTAssertEqual(bmiCalculator.metricHeight, 1.625)
    }
    
//    func testCalculate() {
//        bmiCalculator.setWeight(inPounds: 120)
//        bmiCalculator.setHeight(inFeet:5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.calculate(), 20.30)
//    }
    
    func testUnderWeight() {
//        bmiCalculator.setWeight(inPounds: 99)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.underweight)
    }
    
    func testNormalWeight() {
//        bmiCalculator.setWeight(inPounds: 120)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.normal)
    }
    
    func testOverWeight() {
//        bmiCalculator.setWeight(inPounds: 165)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.overweight)
    }
    
    func testObeseWeight() {
//        bmiCalculator.setWeight(inPounds: 220)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluation, BMI.Category.overweight)
    }
    
}
