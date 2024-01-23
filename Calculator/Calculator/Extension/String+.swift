//
//  String+.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map(String.init)
    }
}
