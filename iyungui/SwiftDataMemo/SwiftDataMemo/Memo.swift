//
//  Memo.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import Foundation
import SwiftData
import SwiftUI
import UIKit

@Model
class Memo {
    let id: UUID
    var title: String
    var text: String
    var colorHex: String
    var createdDate: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy MM dd" // ISO 8601 standard
            return dateFormatter.string(from: createdDate)
        }
    }
    
    var color: Color {
        Color(hex: colorHex)
    }
    
    init(id: UUID = UUID(), title: String, text: String, colorHex: String, createdDate: Date) {
        self.id = id
        self.title = title
        self.text = text
        self.colorHex = colorHex
        self.createdDate = createdDate
    }
}

// Color 확장을 추가하여 16진수 문자열에서 Color 인스턴스를 생성하는 이니셜라이저 추가
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    func toUIColor() -> UIColor {
        // SwiftUI Color를 UIKit UIColor로 변환
        return UIColor(self)
    }

    func rgba() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        // UIColor를 사용하여 RGBa 값을 추출
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        return toUIColor().getRed(&red, green: &green, blue: &blue, alpha: &alpha) ? (red, green, blue, alpha) : nil
    }
}
