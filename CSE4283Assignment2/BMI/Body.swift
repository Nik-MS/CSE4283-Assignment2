//
//  Body.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/26/21.
//

import Foundation

/// A type that represents calculatable components of a body.
protocol Body {
    /// Weight in pounds (lbs).
    var weight: Int { get set }
    /// Height in inches
    var height: Int { get set }
}
