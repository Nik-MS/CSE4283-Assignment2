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
    
    @discardableResult
    static func prompt(_ string: String, withRunnableInterfaces interfaces: [Interface]) -> Interface {
        print("> \(string): ")
        
        // List interface options
        for index in interfaces.indices {
            print("\t \(index). \(interfaces[index].name)")
        }
        
        print("> : ", terminator: "")
        let userInput = readLine() ?? ""
        
        // Make sure user enterned a number within the range of choices.
        guard let chosenNumber = Int(userInput),
              interfaces.indices.contains(chosenNumber) else {
            
            LC.error("You must enter the specified number for a listed choice.")
            return LC.prompt(string, withRunnableInterfaces: interfaces)
        }
        
        return interfaces[chosenNumber]
    }
    
    @discardableResult
    static func promptForInt(_ string: String) -> Int {
        print("> \(string): ", terminator: "")
        let userInput = readLine() ?? ""
        
        guard let integerInput = Int(userInput) else {
            LC.error("You must enter a number.")
            return promptForInt(string)
        }
        
        return integerInput
    }
    
    static func notice(_ string: String) {
        print("\n\(string)\n")
    }
}
