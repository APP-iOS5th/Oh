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
    @Query(sort: [SortDescriptor(\Memo.createdDate, order: .forward)]) var memos: [Memo]
    
    var body: some View {
        NavigationStack {
            VStack {
                if memos.isEmpty {
                    Text("메모가 없습니다.\n메모를 추가해주세요.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                } else {
                    List(memos) { memo in
                        HStack {
                            NavigationLink(destination: MemoDetailView(memo: memo)) {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(memo.title)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)

                                    
                                    Text(memo.text)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .lineLimit(5)
                                    
                                    Text(memo.createdString)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            Spacer()
                        }
                        .padding()
                        .background(memo.color)
                        .shadow(radius: 3)
                        .padding()
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                modelContext.delete(memo)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Memos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddMemoView()) {
                        Image(systemName: "square.and.pencil")
                    }
//                    .simultaneousGesture(TapGesture().onEnded({
//                        memoTitle = ""
//                        memoText = ""
//                    }))
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self, inMemory: true)
}
