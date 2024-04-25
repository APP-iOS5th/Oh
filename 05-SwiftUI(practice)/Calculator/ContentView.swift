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
        ["C", "0", ".", "="],
        ["History"]
    ]
    
    @State var display = "0"
    @State var operand1 = ""
    @State var operand2 = ""
    @State var operation = ""
    @State var clearDisplay = true
    @State var history: [String] = []
    @State var showingHistory = false

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(display)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .lineSpacing(10.0)

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

            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.handleButtonPress(button)
                        }, label: {
                            Text(button)
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(width: button == "History" ? 300 : 80, height: 80)
                                .background(buttonBackground(button))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        })
                    }
                }
            }
        }
        .padding(12)
        .sheet(isPresented: $showingHistory) {
            HistoryView(history: history)
        }
    }
    
    func buttonBackground(_ button: String) -> Color {
        switch button {
        case "+", "-", "X", "=", "<":
            return Color.orange
        case "C", "History":
            return Color.black
        case ".":
            return Color.black
        default:
            return Color.gray
        }
    }
    
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
            if !display.isEmpty && display != "0" {
                display.removeLast()
                if display.isEmpty {
                    display = "0"
                }
            }
        case "History":
            showingHistory = true
        default:
            if clearDisplay {
                display = button
                clearDisplay = false
            } else {
                display += button
            }
        }
    }
    
    func calculate() -> String {
        if let num1 = Double(operand1), let num2 = Double(operand2) {
            var result = ""
            switch operation {
            case "X":
                result = "\(operand1) X \(operand2) = \(num1 * num2)"
            case "-":
                result = "\(operand1) - \(operand2) = \(num1 - num2)"
            case "+":
                result = "\(operand1) + \(operand2) = \(num1 + num2)"
            default:
                result = "0"
            }
            history.append(result)
            return String(result.split(separator: "=").last?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "0")
        } else {
            return "0"
        }
    }
}

struct HistoryView: View {
    let history: [String]
    
    var body: some View {
        List(history, id: \.self) { item in
            Text(item)
        }
    }
}

#Preview {
    ContentView()
}
