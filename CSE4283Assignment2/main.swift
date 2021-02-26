//
//  main.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation
import ArgumentParser

LC.title("CSE 4283 -- Assignment 2")

let dummyData = ["Body Mass Index", "Retirement Savings"]
let answer = LC.prompt("Select an Action to Perform", withChoices: dummyData)

print("You selected to perform \(answer)")
