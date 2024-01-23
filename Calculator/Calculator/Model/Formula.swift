//
//  Formula.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        var operands = operands
        var operators = operators
        guard var result = operands.dequeue() else { return Double() }
        
        while let operand = operands.dequeue(),
              let `operator` = operators.dequeue() {
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
