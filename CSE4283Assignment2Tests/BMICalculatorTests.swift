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
        bmiCalculator.setWeight(inPounds: 0)
        XCTAssertEqual(bmiCalculator.weight, 0)
        XCTAssertEqual(bmiCalculator.$weight, 0)
        
        bmiCalculator.setWeight(inPounds: 1)
        XCTAssertEqual(bmiCalculator.weight, 1)
        XCTAssertEqual(bmiCalculator.$weight, 0.45)
        
        bmiCalculator.setWeight(inPounds: 120)
        XCTAssertEqual(bmiCalculator.weight, 120)
        XCTAssertEqual(bmiCalculator.$weight, 54)
        
        bmiCalculator.setWeight(inPounds: 1001)
        XCTAssertEqual(bmiCalculator.weight, 1001)
        XCTAssertEqual(bmiCalculator.$weight, 450.45)
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
    
    func testSuccessfulCalculate() {
        bmiCalculator.setWeight(inPounds: 120)
        bmiCalculator.setHeight(inFeet:5, inches: 5)
        XCTAssertEqual(try! bmiCalculator.calculate(), 20.4)
        
        bmiCalculator.setWeight(inPounds: 177)
        bmiCalculator.setHeight(inFeet: 4, inches: 8)
        XCTAssertEqual(try! bmiCalculator.calculate(), 40.6)
        
        // Example from: http://extoxnet.orst.edu/faqs/dietcancer/web2/twohowto.html
        bmiCalculator.setWeight(inPounds: 125)
        bmiCalculator.setHeight(inFeet: 5, inches: 3)
        XCTAssertEqual(try! bmiCalculator.calculate(), 22.7)
    }
    
    func testCalculateWithThrownError() {
        bmiCalculator.setWeight(inPounds: 0)
        bmiCalculator.setHeight(inFeet: 0, inches: 0)
        XCTAssertThrowsError(try bmiCalculator.calculate(), "Throws with Invalid Weight Error") { error in
            switch error as! BMICalculator.BMICalculatorError {
            case let .invalidWeight(weight):
                XCTAssertEqual(weight, 0)
            default:
            XCTFail() // Fail when inValidWeight is not called
            }
        }
        
        bmiCalculator.setWeight(inPounds: 10)
        bmiCalculator.setHeight(inFeet: 0, inches: 0)
        XCTAssertThrowsError(try bmiCalculator.calculate(), "Throws with Invalid Height Error") { error in
            switch error as? BMICalculator.BMICalculatorError {
            case let .invalidHeight(height):
                XCTAssertEqual(height, 0)
            default:
            XCTFail() // Fail when inValidHeight is not called
            }
        }
    }
    
    func testUnderWeight() {
        // Minimum
        bmiCalculator.setWeight(inPounds: 1)
        bmiCalculator.setHeight(inFeet: 12, inches: 0)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.underWeight, "BMI at 0")
        // In range
        bmiCalculator.setWeight(inPounds: 99)
        bmiCalculator.setHeight(inFeet: 5, inches: 5)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.underWeight, "BMI at 16.9")
        // At max
        bmiCalculator.setWeight(inPounds: 136)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.underWeight, "BMI at 18.4")
        // Over max
        bmiCalculator.setWeight(inPounds: 137)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertNotEqual(try bmiCalculator.evaluate(), BMICategory.underWeight, "BMI at 18.5")
    }
    
    func testNormalWeight() {
        // Under Normal range
        bmiCalculator.setWeight(inPounds: 136)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertNotEqual(try bmiCalculator.evaluate(), BMICategory.normalWeight, "BMI at 18.4")
        
        // Minimum
        bmiCalculator.setWeight(inPounds: 137)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.normalWeight, "BMI at 18.5")
        
        // In range
        bmiCalculator.setWeight(inPounds: 150)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.normalWeight, "BMI at 20.3")
        
        // Maximum Normal range
        bmiCalculator.setWeight(inPounds: 184)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.normalWeight, "BMI at 24.9")
        
        // Over Normal range
        bmiCalculator.setWeight(inPounds: 185)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertNotEqual(try bmiCalculator.evaluate(), BMICategory.normalWeight, "BMI at 25")
    }

    func testOverWeight() {
        // Under Overweight range
        bmiCalculator.setWeight(inPounds: 184)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertNotEqual(try bmiCalculator.evaluate(), BMICategory.overWeight, "BMI at 24.9")
        
        // Minimum Overweight range
        bmiCalculator.setWeight(inPounds: 185)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.overWeight, "BMI at 25")
        
        // In range
        bmiCalculator.setWeight(inPounds: 200)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.overWeight, "BMI at 27")
        
        // Maximum Overweight range
        bmiCalculator.setWeight(inPounds: 221)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertEqual(try bmiCalculator.evaluate(), BMICategory.overWeight, "BMI at 29.9")
        
        // Over Overweight range
        bmiCalculator.setWeight(inPounds: 222)
        bmiCalculator.setHeight(inFeet: 6, inches: 1)
        XCTAssertNotEqual(try bmiCalculator.evaluate(), BMICategory.overWeight, "BMI at 30")
        
    }
//
//    func testObeseWeight() {
//        bmiCalculator.setWeight(inPounds: 220)
//        bmiCalculator.setHeight(inFeet: 5, inches: 5)
//
//        XCTAssertEqual(bmiCalculator.evaluate(), BMICategory.overweight)
//    }
}
