//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

protocol CalculateItem {}

struct CalculatorItemQueue<Element: CalculateItem>: Queuable {
    private var inputStack = [Element]()
    private var outputStack = [Element]()
    
    mutating func enqueue(_ newElement: Element) {
        inputStack.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.popLast()
    }
}
