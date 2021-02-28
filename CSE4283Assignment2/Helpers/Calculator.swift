//
//  Calculator.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/28/21.
//

import Foundation

protocol Calculator {
    associatedtype resultType
    
    @discardableResult
    func calculate() throws -> resultType
}
