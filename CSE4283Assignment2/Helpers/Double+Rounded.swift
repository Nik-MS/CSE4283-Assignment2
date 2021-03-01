//
//  Double+Rounded.swift
//  CSE4283Assignment2
//
//  Created by Nikhil Menon on 2/28/21.
//

import Foundation

extension Double {
    enum DecimalRoundingRule: Double {
        case nearestTenth = 10
    }
    
    func roundDecimal(_ place: DecimalRoundingRule) -> Double {
        return ((self * place.rawValue).rounded()) / place.rawValue
    }
}
