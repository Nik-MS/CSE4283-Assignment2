//
//  ExitInterface.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/28/21.
//

import Foundation

struct ExitInterface: Interface {
    var name: String = "Exit Program"
    func run() {
        exit(0)
    }
}
