//
//  CalculatorView.swift
//  Calculator
//
//  Created by Gundy on 1/24/24.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var calculator: CalculatorViewModel
    private let buttonTitles = ["AC","CE","⁺⁄₋","÷",
                                "7","8","9","×",
                                "4","5","6","―",
                                "1","2","3","+",
                                "0","00",".","="]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(calculator.inputs.indices, id: \.self) { index in
                        HStack {
                            Spacer()
                            Text(calculator.inputs[index])
                        }
                    }
                    .font(.title3)
                }
            }
            Spacer()
            HStack {
                Text(calculator.operator)
                Spacer()
                Text(calculator.number)
            }
            .font(.largeTitle)
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
                ForEach(buttonTitles, id: \.self) { title in
                    Button {
                        calculator.input(title)
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.gray)
                            Text(title)
                        }
                    }
                    .font(.largeTitle)
                    .aspectRatio(1, contentMode: .fill)
                    .foregroundStyle(.white)
                }
            }
        }
        .padding()
    }
}

#Preview {
    CalculatorView(calculator: CalculatorViewModel())
}
