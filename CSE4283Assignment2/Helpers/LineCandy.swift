//
//  LineCandy.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/24/21.
//

import Foundation

typealias LC = LineCandy

/// Simple Type that contains static methods for printing lines.
enum LineCandy {
    
    /// Prints a noticable font representing a title.
    ///
    ///     //======= FooBar =======\\
    ///
    /// - Parameter string: The title name.
    static func title(_ string: String) {
        print("//======= \(string) =======\\\\\n")
    }
    
    /// Prints a font representing a header.
    ///
    ///     _____ FooBar ____
    ///
    ///
    ///
    /// - Parameter string: The name for the header
    static func header(_ string: String) {
        print("_____ \(string) ____\n")
    }
    
    
    /// Prints a statement representing an error message.
    /// - Parameter errorMsg: The error message to format.
    static func error(_ errorMsg: String) {
        print("\n !! ERROR: \(errorMsg)\n")
    }
    
    /// Prints a given statement with an option list of choices. Method waits for user to enter a number by calling `readLine()`.
    ///  Entering an invalid number will result in an error message and  `prompt(withChoices:)` is called recursively until a corrent input is provided.
    /// - Parameter string: The statement for the prompt
    /// - Parameter choices: The choices that a user can select from. Default value set to `nil`
    /// - Returns: If options are not provided:  returns the user input as a `String` If options options are provided: Method returns the choice that the user selected as a `String`
    @discardableResult
    static func prompt(_ string: String, withChoices choices: [String]? = nil) -> String {
        
        // Check if choices exist. Read and return user input if no choices exist.
        guard let choices = choices else {
            print("> \(string): ", terminator: "")
            let userInput = readLine()
            return userInput ?? ""
        }
        
        print("> \(string): ")
        for index in choices.indices {
            print("\t \(index). \(choices[index])")
        }
        
        print("> : ", terminator: "")
        let userInput = readLine() ?? ""
        
        // Make sure user enterned a number within the range of choices.
        guard let chosenNumber = Int(userInput),
              choices.indices.contains(chosenNumber) else {
            
            LC.error("You must enter the specified number for a listed choice.")
            return LC.prompt(string, withChoices: choices)
        }
        
        return choices[chosenNumber]
    }
}
