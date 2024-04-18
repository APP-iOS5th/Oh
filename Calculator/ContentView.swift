//
//  ContentView.swift
//  Calculator
//
//  Created by 장예진 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    // 계산기 button list
    let buttons = [
        ["1", "2", "3", "X"],
        ["4", "5", "6", "-"],
        ["7", "8", "9", "+"],
        ["C", "0", ".", "="]
    ]
    
    @State var display = "0"
    @State var operand1 = ""
    @State var operand2 = ""
    @State var operation = ""
    @State var clearDisplay = true
    
    var body: some View {
        VStack(spacing: 10) {
            // HStack for display and backspace button
            HStack {
                // Display text
                Text(display)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .lineSpacing(10.0)

                // Backspace button
                Button(action: {
                    self.handleButtonPress("<")
                }, label: {
                    Text("<")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(width: 80, height: 80)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                })
            }

            // 계산기 button grid
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            // 버튼 click handler
                            handleButtonPress(button)
                        }, label: {
                            Text(button)
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(width: 80, height: 80)
                                .background(buttonBackground(button))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }
                }
            }
        }
        .padding(12)
    }
    
    // 버튼 배경 색상
    func buttonBackground(_ button: String) -> Color {
        switch button {
        case "+", "-", "X", "=", "<":
            return Color.orange
        case "C":
            return Color.black
        case ".":
            return Color.black
        default:
            return Color.gray
        }
    }
    
    // 계산기 버튼 클릭 핸들러
    func handleButtonPress(_ button: String) {
        switch button {
        case "C":
            display = "0"
            operand1 = ""
            operand2 = ""
            operation = ""
            clearDisplay = true
        case "+", "-", "X":
            operation = button
            operand1 = display
            clearDisplay = true
        case "=":
            operand2 = display
            let result = calculate()
            display = result
            operand1 = ""
            operand2 = ""
            operation = ""
            clearDisplay = true
        case "<":
            // "<" 버튼: 마지막 숫자를 삭제
            if !display.isEmpty && display != "0" {
                display.removeLast()
                if display.isEmpty {
                    display = "0"
                }
            }
        default:
            if clearDisplay {
                display = button
                clearDisplay = false
            } else {
                display += button
            }
        }
    }
    
    // 계산 함수
    func calculate() -> String {
        if let num1 = Double(operand1), let num2 = Double(operand2) {
            switch operation {
            case "X":
                return String(num1 * num2)
            case "-":
                return String(num1 - num2)
            case "+":
                return String(num1 + num2)
            default:
                return "0"
            }
        } else {
            return "0"
        }
    }
}

#Preview {
    ContentView()
}
