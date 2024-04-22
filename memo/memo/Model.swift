//
//  Model.swift
//  memo
//
//  Created by 어재선 on 4/22/24.
//

import Foundation
import SwiftUI

struct Memo: Identifiable {
    var id: UUID = UUID()
    var text: String
    var color: Color
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
}

class MemoStore:ObservableObject {
    @Published var memos: [Memo] = []
}
