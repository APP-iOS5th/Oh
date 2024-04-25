//
//  Store.swift
//  Mememo
//
//  Created by Mac on 4/22/24.
//

import SwiftUI
import SwiftData

@Model
class Memo {
    var id: UUID
    var text: String
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    init(id: UUID, text: String, created: Date) {
        self.id = id
        self.text = text
        self.created = created
    }
    
}
