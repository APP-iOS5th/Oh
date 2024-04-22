//
//  MemoAddView.swift
//  memo
//
//  Created by 어재선 on 4/22/24.
//

import SwiftUI

struct MemoAddView: View {
    var memoStore: MemoStore
    @Binding var isSheetShowing: Bool
    @Binding var memoText: String
    @Binding var memoColor: Color
    let colors: [Color]
    
    var body: some View {
        VStack {
            HStack{
                Button("취소") {
                    isSheetShowing = false
                }
                Spacer()
                Button("완료"){
                    memoStore.addMemo(memoText, color: memoColor)
                    isSheetShowing = false
                }.disabled(memoText.isEmpty)
            }
            HStack{
                ForEach(colors, id: \.self) { color in
                    Button{ memoColor = color } label: {
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
            Divider().padding()
            TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                .padding()
                .foregroundStyle(.white)
                .background(memoColor)
                .shadow(radius: 3)
        }
    }
}

