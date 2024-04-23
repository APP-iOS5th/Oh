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
                }
            }
            .listStyle(.plain)
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        isSheetShowing = true }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(memos: memos, isSheetShowing: $isSheetShowing, colors: colors)
            }
        }
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
