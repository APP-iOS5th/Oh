//
//  ContentView.swift
//  Calculator
//
//  Created by Mac on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    let buttons = [
    ["7","8", "9", "/"],
    ["4","5", "6", "*"],
    ["1","2", "3", "-"],
    [".","0", "C", "+"],
    ["="]
    ]
    
    var body: some View {
        VStack {
          
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { buttonChar in
                        Button(action: {}) {
                            Text(buttonChar)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .font(.system(size: 48))
                                .foregroundColor(buttonChar == "C" ? .red : .black)
                                .border(Color.gray.opacity(0.2))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
