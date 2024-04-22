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
                    VStack(alignment: .leading, spacing: 10) {
                        Text(memo.title)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(memo.text)
                            .font(.subheadline)
                        Text(memo.createdString)
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                    }
                    Spacer()
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
    
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
