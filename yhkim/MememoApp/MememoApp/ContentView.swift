//
//  ContentView.swift
//  MememoApp
//
//  Created by 김영훈 on 4/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    @State var memoCreated: Date = Date()
    @State var memoValue: Memo? = nil
    
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        NavigationStack {
            List(memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)")
                            .font(.title)
                        Text("\(memo.createdString)")
                            .font(.body)
                            .padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu {
                    ShareLink(item: memo.text)
                    Button {
                        modelContext.delete(memo)
                    } label: {
                        Image(systemName: "trash")
                        Text("삭제")
                    }
                    Button {
                        memoText = memo.text
                        memoColor = memo.color
                        memoCreated = memo.created
                        memoValue = memo
                        isSheetShowing = true
                    } label: {
                        Image(systemName: "pencil")
                        Text("수정")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        memoText = ""
                        memoColor = .blue
                        memoCreated = Date()
                        memoValue = nil
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(memoValue: memoValue, isSheetShowing: $isSheetShowing, memoText: $memoText, memoColor: $memoColor, memoCreated: $memoCreated, colors: colors)
            }
        }
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
