//
//  MemoAddView.swift
//  memo
//
//  Created by 어재선 on 4/22/24.
//

import SwiftUI

struct MemoAddView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isSheetShowing: Bool
    @Binding var memoText: String
//    @Binding var memoColor: Color
//    let colors: [Color]
    
    var body: some View {
        VStack {
            HStack{
                Button("취소") {
                    isSheetShowing = false
                }
                Spacer()
                Button("완료"){
//                    memoStore.addMemo(memoText)
                    
                    // 완료시 swift data 에 하나씩 추가
                    modelContext.insert(Memo(text: memoText, created: Date()))
                    isSheetShowing = false
                }.disabled(memoText.isEmpty)
            }
            .padding(20)
            Divider().padding()
            TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                .padding()
                .foregroundStyle(.black)
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
