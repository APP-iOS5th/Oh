//
//  ContentView.swift
//  memo
//
//  Created by 어재선 on 4/22/24.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var memoStore: MemoStore = MemoStore()
    
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    var body: some View {
        NavigationStack {
            List(memoStore.memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)").font(.title)
                        Text("\(memo.createdString)").font(.body).padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(.white)
                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu{
                    ShareLink(item: memo.text)
                    Button{
                        memoStore.removeMemo(memo)
                    } label: {
                        Image(systemName: "trash.slash")
                        Text("삭제")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        memoText = ""; isSheetShowing = true
                    }
                }
            }.sheet(isPresented: $isSheetShowing) {
                MemoAddView(memoStore: memoStore, isSheetShowing: $ isSheetShowing, memoText: $memoText, memoColor: $memoColor, colors: colors)
            }
        }
    }
}

#Preview {
    ContentView()
}
