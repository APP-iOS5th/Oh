//
//  Item.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
