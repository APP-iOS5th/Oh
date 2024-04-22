//
//  ContentView.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var memos: [Memo]
    
    @State private var isShowingSheet: Bool = false
    @State private var memoText: String = ""
    @State private var memoTitle: String = ""

    var body: some View {
        NavigationStack {
            List(memos) { memo in
                HStack {
                    VStack {
                        Text(memo.title)
                            .font(.headline)
                        Text(memo.text)
                    }
=
                }
            }
            .navigationTitle("Memos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                AddMemoView(memoTitle: $memoTitle, memoText: $memoText)
            }
        }
    }
    
    func addMemo(title: String, text: String) {
        let newMemo = Memo(title: title, text: text, createdDate: Date())
        modelContext.insert(newMemo)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
