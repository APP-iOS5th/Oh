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
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isSheetShowing = true
                        } label: {
                            Image(systemName: "추가")
                        }
                    }
                }
                .sheet(isPresented: $isSheetShowing) {
                    MemoAddView(isSheetShowing: $isSheetShowing)
                }
            }
        }
    }
    struct MemoAddView: View {
        @Environment(\.modelContext) var modelContext
        @Binding var isSheetShowing: Bool
        @State var memoText: String = ""
        @State var memoColor: Color = .cyan
        let colors: [Color] = [.blue, .cyan, .yellow, .indigo]
        
        var body: some View {
            VStack {
                HStack {
                    Button("취소") {
                        isSheetShowing = false }
                    Spacer()
                    Button("완료") {
                        addMemo(memoText)
                        isSheetShowing = false
                    }
                    .disabled(memoText.isEmpty)
                }
                HStack {
                    ForEach(colors, id: \.self) { color in
                        Button { memoColor = color } label: {
                            HStack {
                                Spacer()
                                if color == memoColor {
                                    Image(systemName: "checkmark.circle")
                                }
                                Spacer()
                            }
                            .padding()
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .background(color)
                            .shadow(radius: color == memoColor ? 8 : 0)
                        }
                    }
                }
                Divider()
                    .padding()
                TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                    .padding()
                    .foregroundColor(.white)
                    .background(memoColor)
                    .shadow(radius: 3)
                Spacer()
            }
        }
        func addMemo(_ text: String) {
            let memo = Memo(id: UUID(), text: text, created: Date())
            modelContext.insert(memo)
        }
    }
#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}

