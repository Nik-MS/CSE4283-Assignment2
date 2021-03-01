//
//  Interface.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/28/21.
//

import Foundation

protocol Interface {
    var name: String { get }
    mutating func run()
}
