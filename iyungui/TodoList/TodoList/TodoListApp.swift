//
//  TodoListApp.swift
//  TodoList
//
//  Created by 이융의 on 4/25/24.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self)
        }
    }
}
