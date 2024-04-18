//
//  ContentView.swift
//  Calculator
//
//  Created by 이융의 on 4/18/24.
//

import SwiftUI


struct ContentView: View {
    @State private var displayValue: String = "0"
    @State private var resultNumber: Int = 0
    
    let buttons: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // 디스플레이 영역
            Text(displayValue)
                .font(.largeTitle)
                .padding()
            // 버튼 배열
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 20) {
                    ForEach(row, id: \.self) { button in
                        Button(button) {
                            // 버튼 처리 로직
                            self.buttonTapped(button)
                        }
                        .font(.title)
                        .frame(width: 64, height: 64)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(32)
                    }
                }
            }
        }
        .padding()
    }
    
    private func buttonTapped(_ button: String) {
        // 버튼 클릭 처리 로직
    }
}

#Preview {
    ContentView()
}
