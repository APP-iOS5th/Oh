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
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["C", "0", ".", "="]
    ]
    
    // 현재 화면에 넣으면 나오는 거
    @State var display = "0"
    // 피연산자1
    @State var operand1 = ""
    // 피연산자2
    @State var operand2 = ""
    // 현재 선택된 연산자
    @State var operation = ""
    // 화면 초기화 여부
    @State var clearDisplay = true
    
    var body: some View {
        VStack(spacing: 12) {
            // 현재 화면에 표시될 값
            Text(display)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .padding(.trailing, 24)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .lineSpacing(10.0)
            
            // 계산기 button grid
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            // 버튼 click hanlder
                            handleButtonPress(button)
                        }, label: {
                            Text(button)
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(minWidth: 80, maxWidth: 80, minHeight:80 ,maxHeight: 50 )
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
        case "X", "-", "+", "=":
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
            // "C" 버튼: 화면 초기화
            display = "0"
            operand1 = ""
            operand2 = ""
            operation = ""
            clearDisplay = true
        case "X", "-", "+":
            // 연산자 버튼: 피연산자 설정
            operation = button
            operand1 = display
            clearDisplay = true
        case "=":
            // "=" 버튼: 계산 수행
            operand2 = display
            let result = calculate()
            display = result
            operand1 = ""
            operand2 = ""
            operation = ""
            clearDisplay = true
        default:
            // 숫자나 "." 버튼: 현재 값에 추가
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
        // 피연산자와 연산자 추출
    // 올바른 숫자 형식으로 변환하여 계산 수행
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
        // 올바른 숫자 형식이 아닌 경우 "0"으로 처리
        return "0"
    }
}
}

#Preview {
    ContentView()
}
