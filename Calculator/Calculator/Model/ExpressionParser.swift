//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        
        componentsByOperators(from: input)
            .compactMap(Double.init)
            .forEach { operands.enqueue($0) }
        
        var operators = CalculatorItemQueue<Operator>()
        
        input
            .compactMap(Operator.init)
            .forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result = [input]
        
        Operator.allCases.forEach { `operator` in
            result = result.flatMap { $0.split(with: `operator`.rawValue) }
        }
        
        return result
    }
}
