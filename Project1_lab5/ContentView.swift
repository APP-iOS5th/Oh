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
}

enum PrevOperator {
    case plus
    case minus
    case devide
    case multiply
    case equal
}

struct ContentView: View {
    @State private var text: String = "0"
    @State private var prevPressed: PrevPressed = .inputOperator
    @State private var prevOperator: PrevOperator = .plus
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
                            case "/" :
                                pressOperator(inputOperator: .devide)
                            case "*" :
                                pressOperator(inputOperator: .multiply)
                            case "+" :
                                pressOperator(inputOperator: .plus)
                            case "-" :
                                pressOperator(inputOperator: .minus)
                            case "C":
                                {
                                    text = "0"
                                    lhs = 0
                                    rhs = 0
                                    prevPressed = .inputOperator
                                    prevOperator = .plus
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
                pressOperator(inputOperator: .equal)
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
            if prevOperator == .equal {
                print("새로운 계산을 하려면 초기화하세요")
            } else {
                rhs = number
                text += String(number)
                prevPressed = .number
            }
        }
    }
    
    func pressOperator(inputOperator: PrevOperator) -> Void {
        switch prevPressed {
        case .number:
            switch prevOperator {
            case .plus:
                lhs = lhs + rhs
            case .minus:
                lhs = lhs - rhs
            case .devide:
                lhs = lhs / rhs
            case .multiply:
                lhs = lhs * rhs
            case .equal:
                print("error")
            }
            switch inputOperator {
            case .plus:
                text += "+"
            case .minus:
                text += "-"
            case .devide:
                text += "/"
            case .multiply:
                text += "*"
            case .equal:
                text = String(lhs)
            }
            prevOperator = inputOperator
            prevPressed = .inputOperator
        case .inputOperator:
            switch prevOperator {
            case .equal:
                switch inputOperator {
                case .plus:
                    text += "+"
                case .minus:
                    text += "-"
                case .devide:
                    text += "/"
                case .multiply:
                    text += "*"
                case .equal:
                    text = String(lhs)
                }
                prevOperator = inputOperator
                prevPressed = .inputOperator
            default:
                print("Wrong Input")
            }
            print("Wrong Input")
        }
    }
}

#Preview {
    ContentView()
}
