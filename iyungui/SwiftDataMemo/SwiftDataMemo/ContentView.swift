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
    
    @State private var memoText: String = "new memo"
    @State private var memoTitle: String = ""

    var body: some View {
        NavigationStack {
            List(memos) { memo in
                HStack {
                    Text(memo.title)
                }
            }
            .navigationTitle("Memos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        addMemo(title: memoTitle, text: memoText)
                    }) {
                        Image(systemName: "plus")
                    }
                }
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
