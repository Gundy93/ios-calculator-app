//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @StateObject var calculator = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView(calculator: calculator)
        }
    }
}
