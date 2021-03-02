//
//  RetirementCalculator+Interface.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 3/2/21.
//

import Foundation

extension RetirementCalculator: Interface {
    mutating func run() {
        LC.header(name)
        
        let age = LC.promptForInt("Input current age")
        let salary = LC.promptForInt("Input your annual salary")
        let percentSavings = LC.promptForInt("Input percent of your salary saved.")
        let goal = LC.promptForInt("Input your savings goal")
        
        configure(withAge: age, salary: salary, percentSaved: percentSavings, goal: goal)
        
        calculateGoalAge { result in
            switch result {
            case .success(let ageAtGoal):
                LC.notice(("You will be \(ageAtGoal) years old when your savings reaches \(goal)"))
            case .failure(let error):
                LC.error(error.localizedDescription)
            }
        }
    }
}
