//
//  Memo.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Memo: Identifiable {
    let id: UUID
    var title: String
    var text: String
    var createdDate: Date
    
    @Relationship(inverse: \Tag.memo) var tags: [Tag]?

    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: createdDate)
        }
    }
    
    
    init(id: UUID = UUID(), title: String, text: String, createdDate: Date) {
        self.id = id
        self.title = title
        self.text = text
        self.createdDate = createdDate
    }
}

@Model
final class Tag {
    var tag: String
    
    var memo: Memo?
    
    init(tag: String) {
        self.tag = tag
    }
}

