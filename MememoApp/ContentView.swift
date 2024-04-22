//
//  ContentView.swift
//  MememoApp
//
//  Created by 김영훈 on 4/22/24.
//

import SwiftUI
import SwiftData

@Model
class Memo: Identifiable {
    var id: UUID
    var text: String
//    var colorHex: String
//    var color: Color
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    init(id: UUID = UUID(), text: String, created: Date) {
        self.id = id
        self.text = text
//        self.colorHex = colorHex
//        self.color = color
        self.created = created
    }
//    var color: Color {
//        Color(hex: colorHex)
//    }
}
//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        var rgbValue: UInt64 = 0
//        
//        scanner.scanHexInt64(&rgbValue)
//        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
//        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
//        let b = Double(rgbValue & 0x0000FF) / 255.0
//        self.init(red: r, green: g, blue: b)
//    }
//}

//class MemoStore: ObservableObject {
//    @Published var memos: [Memo] = []
//    func addMemo(_ text: String, color: Color) {
//        let memo: Memo = Memo(text: text, color: color, created: Date())
//        memos.insert(memo, at: 0)
//    }
//    func removeMemo(_ targetMemo: Memo) {
//        if let index = memos.firstIndex(where: { $0.id == targetMemo.id }) {
//            memos.remove(at: index)
//        }
//    }
//}

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
//                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu {
//                    ShareLink(item: memo.text)
                    Button { removeMemo(memo) } label: {
                        Image(systemName: "trash.slash")
                        Text("삭제")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {memoText = ""; isSheetShowing = true }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(memos: memos, isSheetShowing: $isSheetShowing, memoText: $memoText, colors: colors)
            }
        }
    }
    func removeMemo(_ targetMemo: Memo) {
            modelContext.delete(targetMemo)
    }
}

// Preview Contents/previewContainer.swift
@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Memo.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        return container
    } catch {
        fatalError()
    }
}()

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
