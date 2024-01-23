//
//  Calculator.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

struct Calculator {
    private(set) var inputs = [String]()
    private(set) var `operator` = ""
    private var absoluteValue = ""
    private var currentExpression = ""
    private var isNegative = false
    private var isCalculated = false
    private var containsDot = false
    
    var number: String {
        let value = absoluteValue.isEmpty ? "0" : absoluteValue
        
        return isNegative ? "-" + value : value
    }
    
    mutating func input(_ number: String) {
        absoluteValue += number
    }
    
    mutating func inputDot() {
        guard containsDot == false else { return }
        
        if absoluteValue.isEmpty {
            absoluteValue += "0"
        }
        
        containsDot = true
        absoluteValue += "."
    }
    
    mutating func switchOperator(_ operator: String) {
        if isCalculated {
            currentExpression = ""
        }
        
        if absoluteValue.isEmpty == false {
            appendInput()
        }
        
        self.operator = `operator`
    }
    
    private mutating func appendInput() {
        inputs.append(`operator` + " " + number)
        currentExpression += `operator` + number
        reset()
    }
    
    private mutating func reset() {
        `operator` = ""
        absoluteValue = ""
        isNegative = false
        containsDot = false
    }
    
    mutating func calculate() {
        guard isCalculated == false else { return }
        
        appendInput()
        
        let formula = ExpressionParser.parse(from: currentExpression)
        let result = formula.result()
        
        absoluteValue = String(result)
        isCalculated = true
    }
    
    mutating func toggleIsNegative() {
        isNegative.toggle()
    }
    
    mutating func clearEntry() {
        absoluteValue = ""
    }
    
    mutating func clearAll() {
        inputs = []
        isCalculated = false
        currentExpression = ""
        reset()
    }
}
