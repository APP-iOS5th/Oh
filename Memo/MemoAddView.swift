//
//  MemoAddView.swift
//  Memo
//
//  Created by 장예진 on 4/22/24.
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
            HStack {
                Button("cancel") {
                    isSheetShowing = false
                }
                Spacer()
                Button("complete") {
                    memoStore.addMemo(memoText, color: memoColor)
                    isSheetShowing = false
                }
                .disabled(memoText.isEmpty)
//                .modelContainer(for: Memo.self)
            }
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button(action: { memoColor = color }) {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(color)
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            
            Divider().padding()
            
            TextField("Insert Memo", text: $memoText)
                .padding()
                .foregroundColor(.white)
                .background(memoColor)
                .shadow(radius: 3)
            
            Spacer()
        }
        .padding()
    }
}
