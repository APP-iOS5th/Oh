//
//  ContentView.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI
import SwiftData

struct StrikethroughModifier: ViewModifier {
    let strikethrough: Bool
    
    func body(content: Content) -> some View {
        if strikethrough {
            return AnyView(content.strikethrough())
        } else {
            return AnyView(content)
        }
    }
}

struct ContentView: View {
    @Query private var tasks: [Task]
    @Environment(\.modelContext) var modelContext
    @State private var text: String = ""
    var body: some View {
        NavigationStack {
            HStack {
                TextField("New Task", text: $text)
                    .padding()
                    .border(.gray)
                Button("add") {
                    if !text.isEmpty {
                        let newTask = Task(completed: false, taskDescription: text, priority: .medium)
                        modelContext.insert(newTask)
                        text = ""
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
            }
            .padding()
            List(tasks) { task in
                Button {
                    task.completed.toggle()
                } label: {
                    Label {
                        Text(task.taskDescription)
                            .tint(.black)
                            .modifier(StrikethroughModifier(strikethrough: task.completed))
                    } icon: {
                        task.completed ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                    }
                }
                .padding()
                .contextMenu {
                    Button {
                        modelContext.delete(task)
                    } label: {
                        Image(systemName: "trash")
                        Text("delete")
                    }
                    Button {
                        print("edit")
                    } label: {
                        Image(systemName: "square.and.pencil")
                        Text("edit")
                    }
                }
            }
            .navigationTitle("To do List")
        }
    }
}

#Preview {
    ContentView()
}
