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
    @State private var priority: Priority = .medium
    var body: some View {
        NavigationStack {
            HStack {
                Picker("Priority", selection: $priority) {
                    Text("High").tag(Priority.high)
                    Text("Medium").tag(Priority.medium)
                    Text("Low").tag(Priority.low)
                }
                .frame(width: 110)
                TextField("New Task", text: $text)
                    .padding()
                    .border(.gray)
                Button("add") {
                    if !text.isEmpty {
                        let newTask = Task(completed: false, taskDescription: text, priority: priority)
                        modelContext.insert(newTask)
                        text = ""
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
            }
            .padding()
            List {
                ForEach(Priority.allCases, id: \.self){ priority in
                    Section(header: Text(priority.stringValue)){
                        ForEach(tasks.filter {$0.priority == priority }) { task in
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
                            .padding(.horizontal)
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
