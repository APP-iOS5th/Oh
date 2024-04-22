//
//  ContentView.swift
//  memo
//
//  Created by 어재선 on 4/22/24.
//


import SwiftUI
import SwiftData

struct ContentView: View {
//    @ObservedObject var memoStore: MemoStore = MemoStore()
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
//    @State var memoColor: Color = .blue
//    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    var body: some View {
        NavigationStack {
            List(memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)").font(.title)
                        Text("\(memo.createdString)").font(.body).padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(.white)
                .shadow(radius: 3)
                .padding()
                .background(.black)
                .contextMenu{
                    ShareLink(item: memo.text)
                    Button{
                        // 삭제시 swift data에서 삭제
                        modelContext.delete(memo)
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
                MemoAddView( isSheetShowing:$isSheetShowing, memoText: $memoText)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
