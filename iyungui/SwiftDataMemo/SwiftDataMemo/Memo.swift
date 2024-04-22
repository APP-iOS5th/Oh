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
//    var colorHex: String
    var createdDate: Date
    
    @Relationship(inverse: \Tag.memo) var tags: [Tag]?

    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
            return dateFormatter.string(from: createdDate)
        }
    }
    
//    var color: Color {
//        Color(hex: colorHex)
//    }
    
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

//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        var rgbValue: UInt64 = 0
//        scanner.scanHexInt64(&rgbValue)
//        
//        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
//        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
//        let b = Double(rgbValue & 0x0000FF) / 255.0
//        
//        self.init(red: r, green: g, blue: b)
//    }
//}
