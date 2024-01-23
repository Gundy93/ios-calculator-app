//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    @Published private var calculator = Calculator()
    
    var inputs: [String] {
        return calculator.inputs
    }
    
    var `operator`: String {
        return calculator.operator
    }
    
    var number: String {
        return calculator.number
    }
    
    func input(_ value: String) {
        switch value {
        case "0","00","1","2","3","4","5","6","7","8","9":
            calculator.input(value)
        case ".":
            calculator.inputDot()
        case "+","―","÷","×":
            calculator.switchOperator(value)
        case "=":
            calculator.calculate()
        case "⁺⁄₋":
            calculator.toggleIsNegative()
        case "CE":
            calculator.clearEntry()
        case "AC":
            calculator.clearAll()
        default:
            return
        }
    }
}
