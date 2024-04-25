//
//  Task.swift
//  TodoList
//
//  Created by 이융의 on 4/25/24.
//

import Foundation
import SwiftData

enum Priority: Comparable, Codable {
    case high
    case medium
    case low
}

@Model
class Task: Identifiable {
    var id = UUID()
    var completed: Bool
    var content: String
    var priority: Priority
    
    init(completed: Bool, content: String, priority: Priority) {
        self.completed = completed
        self.content = content
        self.priority = priority
    }
}

//
//extension Task {
//    static var tasks = [
//        Task(completed: true, content: "Wake up", priority: .low ),
//        Task(completed: false, content: "Shower", priority: .medium),
//        Task(completed: false, content: "Code", priority: .high),
//        Task(completed: false, content: "Eat", priority: .high ),
//        Task(completed: false, content: "Sleep", priority: .high),
//        Task(completed: false, content: "Get groceries", priority: .high)
//    ]
//    static var task = tasks[0]
//}
