//
//  Model.swift
//  memo
//
//  Created by 어재선 on 4/22/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Memo: Identifiable {
    var id: UUID = UUID()
    var text: String
//    var color: Color
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    init(id: UUID = UUID(), text: String, created: Date) {
        self.id = id
        self.text = text
//        self.color = color
        self.created = created
    }
}

//class MemoStore:ObservableObject {
//    @Published var memos: [Memo] = []
//    
//    func addMemo(_ text: String) {
//        let memo: Memo = Memo(text: text, created: Date())
//        memos.insert(memo, at: 0)
//    }
//    
//    func removeMemo(_ targetMemo: Memo) {
//        if let index = memos.firstIndex(where: { $0.id == targetMemo.id }) {
//            memos.remove(at:  index)
//        }
//    }
//}
