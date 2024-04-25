//
//  ContentView.swift
//  Project1_lab5
//
//  Created by 김영훈 on 4/18/24.
//

import SwiftUI

enum PrevPressed {
    case number
    case inputOperator
    case equal
}

struct ContentView: View {
    @State private var text: String = "0"
    @State private var prevPressed: PrevPressed = .inputOperator
    @State private var prevOperator: String = "+"
    @State private var lhs = 0
    @State private var rhs = 0
    let buttons = [
        ["7","8","9","/"],
        ["4","5","6","*"],
        ["1","2","3","-"],
        [".","0","C","+"]
    ]
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .border(Color.black, width: 2)
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { buttonChar in
                        Button(buttonChar){
                            switch buttonChar {
                            case "/", "*", "+", "-" :
                                pressOperator(inputOperator: buttonChar)
                            case "C":
                                {
                                    text = "0"
                                    lhs = 0
                                    rhs = 0
                                    prevPressed = .inputOperator
                                    prevOperator = "+"
                                } ()
                            default :
                                pressNumber(number: Int(buttonChar) ?? 0)
                            }
                        }
                        .font(.largeTitle)
                        .foregroundColor(buttonChar == "C" ? .red : .black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 2)
                    }
                }
            }
            Button("=") {
                pressOperator(inputOperator: "=")
            }
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .border(Color.black, width: 2)
        }.padding(30)
    }
    
    func pressNumber(number: Int) -> Void {
        switch prevPressed {
        case .number:
            rhs = rhs * 10 + number
            text += String(number)
            prevPressed = .number
        case .inputOperator:
            if text == "0" {
                text = ""
            }
                rhs = number
                text += String(number)
                prevPressed = .number
        case .equal:
            print("새로운 계산을 하려면 초기화하세요")
        }
    }
    
    func pressOperator(inputOperator: String) -> Void {
        switch prevPressed {
        case .number:
            switch prevOperator {
            case "+":
                lhs = lhs + rhs
            case "-":
                lhs = lhs - rhs
            case "/":
                lhs = lhs / rhs
            case "*":
                lhs = lhs * rhs
            case "=":
                print("error")
            default:
                print("error")
            }
            switch inputOperator {
            case "+", "-", "/", "*":
                text += String(inputOperator)
            case "=":
                text = String(lhs)
            default:
                print("error")
            }
            prevOperator = inputOperator
            prevPressed = inputOperator == "=" ? .equal : .inputOperator
        case .inputOperator:
            print("Wrong Input")
        case .equal:
            if inputOperator != "=" {
                text += inputOperator
                prevOperator = inputOperator
                prevPressed = .inputOperator
            }
        }
    }
}

#Preview {
    ContentView()
}
