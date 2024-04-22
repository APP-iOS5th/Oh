//
//  ContentView.swift
//  Memo
//
//  Created by 장예진 on 4/22/24.
//

import SwiftUI

// 메모 목록을 관리하고 표시하는 ContentView 구조체 정의
struct ContentView: View {
    @ObservedObject var memoStore: MemoStore = MemoStore()
    
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    @Environment(\.modelContext) var modelContext
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]

    var body: some View {
        NavigationStack {
            List(memoStore.memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text(memo.text)
                            .font(.title)
                        Text(memo.createdString)
                            .font(.body)
                            .padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
//                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu {
                    ShareLink(item: memo.text)
                    Button(action: {
                        memoStore.removeMemo(memo)
                    }) {
                        Image(systemName: "trash.slash")
                        Text("delete")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("memo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("add") {
                        memoText = ""
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(memoStore: memoStore, isSheetShowing: $isSheetShowing, memoText: $memoText, memoColor: $memoColor, colors: colors)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}

