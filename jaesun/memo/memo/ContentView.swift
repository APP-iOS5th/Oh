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
    
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List (memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)")
                            .font(.title)
                        
                        Text("\(memo.createdString)")
                            .font(.body)
                            .padding(.top)
                        
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
                    }
                    
                    Spacer()
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        // TODO: 메모 추가 액션
                        showSheet = true
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                MemoAddView(showSheet: $showSheet)
            }
        }    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
