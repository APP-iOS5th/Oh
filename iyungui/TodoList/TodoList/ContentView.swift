//
//  ContentView.swift
//  TodoList
//
//  Created by 이융의 on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var todoText: String = "test"
    @Query var tasks: [Task]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(tasks, id: \.id) { task in
                        HStack(spacing: 20) {
                            Image(systemName: task.completed ? "circle.inset.filled" : "circle")
                                .imageScale(.large)
                            Text("\(task.content)")
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("To do List")
            .toolbar {
                Button(action: {
                    addTodo(todoText)
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
    func addTodo(_ todoText: String) {
        let newTodo: Task = Task(completed: false, content: todoText, priority: .high)
        modelContext.insert(newTodo)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
