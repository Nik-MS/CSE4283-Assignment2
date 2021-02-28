//
//  main.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation

LC.title("CSE 4283 -- Assignment 2")

let answer = LC.prompt("Select an Action to Perform", withChoices: [BMICalculator.name])

var bmiCalculator = BMICalculator()

switch answer {
case BMICalculator.name:
    bmiCalculator.run()
    
default:
    fatalError("Program \(answer) does not exist.")
}


