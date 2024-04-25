//
//  MyTodosApp.swift
//  MyTodos
//
//  Created by 장예진 on 4/25/24.
//

import SwiftUI
import SwiftData

@main
struct MyTodosApp: App {
    var body: some Scene{
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
