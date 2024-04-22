//
//  ContentView.swift
//  Mememo
//
//  Created by Mac on 4/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memos) { memo in
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
                    .background(.black)
                    .shadow(radius: 3)
                    .padding()
                    .contextMenu {
                        ShareLink(item: memo.text)
                        Button {
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
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isSheetShowing = true
                        } label: {
                            Image(systemName: "추가")
                        }
                    }
                }
                .sheet(isPresented: $isSheetShowing) {
                    MemoAddView(isSheetShowing: $isSheetShowing, memoText: $memoText, memoColor: $memoColor, colors: colors)
                }
            }
//            func removeMemo(_ memo: Memo) {
//                modelContext.delete(memo)
//            }
//            func addMemo() {
//                modelContext.insert(Memo(text: ""))
//            }
        }
    }
}

