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
    
    /// Prints a given statement and returns the userinput from a `readLine()` call.
    /// - Parameter string: The statement for the prompt
    /// - Returns: the user input
    @discardableResult
    static func prompt(_ string: String, fromChoices choices: [String]? = nil) -> String {
        
        guard let choices = choices else {
            // User has no choices.
            print("> \(string): ", terminator: "") // Print without newline
            let userInput = readLine()
            return userInput ?? ""
        }
        
        print("> \(string): ")
        for index in choices.indices {
            print("\t \(index). \(choices[index])")
        }
        
        print("> : ", terminator: "")
        return readLine() ?? ""
    }
}
