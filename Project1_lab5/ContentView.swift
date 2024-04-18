//
//  ContentView.swift
//  Project1_lab5
//
//  Created by 김영훈 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
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
                    pressOperator(inputOperator: "/")
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
                    pressOperator(inputOperator: "*")
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
                    pressOperator(inputOperator: "-")
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
            }
            HStack() {
                Button(".") {
                    pressOperator(inputOperator: ".")
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
                }
                .font(.largeTitle)
                .foregroundColor(.red)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
                
                Button("+") {
                    pressOperator(inputOperator: "+")
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 70, height: 100)
                .border(Color.black, width: 2)
            }
            Button("=") {
                
            }
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(width: 300, height: 100)
            .border(Color.black, width: 2)
        }.padding()
        
    }
    func pressNumber(number: Int) -> Void {
        text += String(number)
    }
    func pressOperator(inputOperator: String) -> Void {
        text += inputOperator
    }
    
}


#Preview {
    ContentView()
}
