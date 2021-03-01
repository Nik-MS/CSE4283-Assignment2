//
//  main.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation

var programs: [Interface] = [
    BMICalculator(),
    ExitInterface()
]

LC.title("CSE 4283 -- Assignment 2")


while true {
    var selectedProgram = LC.prompt("Select a program to run", withRunnableInterfaces: programs)
    selectedProgram.run()
}


