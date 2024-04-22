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
class Memo {
    let id: UUID
    var text: String
    var color: Color
    var createdDate: Date
    var updatedDate: Date
    
    @Relationship(inverse: \Tag.memo) var tags: [Tag]?

    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: createdDate)
        }
    }
    
    var updatedString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: updatedDate)
        }
    }
    
    init(id: UUID = UUID(), text: String, color: Color, createdDate: Date, updatedDate: Date) {
        self.id = id
        self.text = text
        self.color = color
        self.createdDate = createdDate
        self.updatedDate = updatedDate
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
