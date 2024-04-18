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
    @State private var text: String = ""
    @State private var prevPressed: PrevPressed = .inputOperator
    @State private var prevOperator: PrevOperator = .plus
    @State private var lhs = 0
    @State private var rhs = 0
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .frame(width: 300, height: 50)
                .border(Color.black, width: 2)
            
            HStack() {
                Button("7") {
                    pressNumber(number: 7)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("8") {
                    pressNumber(number: 8)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("9") {
                    pressNumber(number: 9)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("/") {
                    pressOperator(inputOperator: .devide)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
            }
            HStack() {
                Button("4") {
                    pressNumber(number: 4)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("5") {
                    pressNumber(number: 5)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("6") {
                    pressNumber(number: 6)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("*") {
                    pressOperator(inputOperator: .multiply)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
            }
            
            HStack() {
                Button("1") {
                    pressNumber(number: 1)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("2") {
                    pressNumber(number: 2)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("3") {
                    pressNumber(number: 3)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("-") {
                    pressOperator(inputOperator: .minus)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
            }
            HStack() {
                Button(".") {
                    //                    pressOperator(inputOperator: ".")
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("0") {
                    pressNumber(number: 0)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("C") {
                    text = ""
                    lhs = 0
                    rhs = 0
                    prevPressed = .inputOperator
                    prevOperator = .plus
                }
                .font(.largeTitle)
                .foregroundColor(.red)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("+") {
                    pressOperator(inputOperator: .plus)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
            }
            Button("=") {
                pressOperator(inputOperator: .equal)
            }
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(width: 300, height: 100)
            .border(Color.black, width: 2)
        }.padding()
        
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
