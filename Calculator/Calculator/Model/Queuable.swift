//
//  Queuable.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

protocol Queuable {
    associatedtype Element
    
    mutating func enqueue(_ newElement: Element)
    mutating func dequeue() -> Element?
}
