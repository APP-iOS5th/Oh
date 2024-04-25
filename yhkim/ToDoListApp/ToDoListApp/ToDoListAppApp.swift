//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI

@main
struct ToDoListAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self)
        }
    }
}
