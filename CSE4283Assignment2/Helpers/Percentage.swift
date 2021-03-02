//
//  Percentage.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 3/1/21.
//

import Foundation

@propertyWrapper struct Percentage {
    
    var wrappedValue: Double {
        didSet {
            wrappedValue = wrappedValue / 100
        }
    }
    
    init(wrappedValue: Double) {
        self.wrappedValue = wrappedValue
    }
}
