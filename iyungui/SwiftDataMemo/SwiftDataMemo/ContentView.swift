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
    
    @State var memoText: String = ""
    @State var memoTitle: String = ""
    @State var memoColor: Color = .blue

    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
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
                                deleteMemo(memo)
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
                    NavigationLink(destination: AddMemoView(memoTitle: $memoTitle, memoText: $memoText, memoColor: $memoColor, colors: colors)) {
                        Image(systemName: "square.and.pencil")
                    }
                    .simultaneousGesture(TapGesture().onEnded({
                        memoTitle = ""
                        memoText = ""
                    }))
                }
            }
        }
    }
    func deleteMemo(_ memo: Memo) {
        modelContext.delete(memo)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
