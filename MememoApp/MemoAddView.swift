//
//  MemoAddView.swift
//  MememoApp
//
//  Created by 김영훈 on 4/22/24.
//

import SwiftUI

struct MemoAddView: View {
    var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    @Binding var isSheetShowing: Bool
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    let colors: [Color]
    
    var body: some View {
        VStack {
            HStack {
                Button("취소") { isSheetShowing = false}
                Spacer()
                Button("완료") {
                    let newMemo = Memo(text: memoText, color: memoColor, created: Date())
                    modelContext.insert(newMemo)
                    isSheetShowing = false
                }
                .disabled(memoText.isEmpty)
            }
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(color)
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            Divider()
                .padding()
            TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                .padding()
                .foregroundColor(.white)
                .background(memoColor)
                .shadow(radius: 3)
            Spacer()
        }
        .padding()
    }
}
