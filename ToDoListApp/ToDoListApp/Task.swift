//
//  Task.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import Foundation
import SwiftData

enum Priority: Comparable, Codable, CaseIterable {
    case high
    case medium
    case low
    
    var stringValue: String {
        switch self {
        case .high:
            return "High"
        case .medium:
            return "Medium"
        case .low:
            return "Low"
        }
    }
}

@Model
class Task: Identifiable {
    var id = UUID()
    var completed: Bool
    var taskDescription: String
    var priority: Priority
    
    init(completed: Bool, taskDescription: String, priority: Priority) {
        self.completed = completed
        self.taskDescription = taskDescription
        self.priority = priority
    }
}

//extension Task {
//    static var tasks = [
//        Task(completed: false, description: "Wake up", priority: .low ),
//        Task(completed: false, description: "Shower", priority: .medium),
//        Task(completed: false, description: "Code", priority: .high),
//        Task(completed: false, description: "Eat", priority: .high ),
//        Task(completed: false, description: "Sleep", priority: .high),
//        Task(completed: false, description: "Get groceries", priority: .high)
//    ]
//    static var task = tasks[0]
//}
