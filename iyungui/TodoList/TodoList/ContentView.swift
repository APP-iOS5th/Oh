//
//  ContentView.swift
//  TodoList
//
//  Created by 이융의 on 4/25/24.
//
/*
 1. sort
 2. editable
*/


import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var newTodoText: String = ""
    @State private var newPriority: Priority = .medium
    @State private var editingContents: [UUID: String] = [:]

    @Query var tasks: [Task]

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(tasks, id: \.id) { task in
                        HStack(spacing: 20) {
                            Button(action: {
                                task.completed.toggle()
                            }) {
                                Image(systemName: task.completed ? "circle.inset.filled" : "circle")
                                    .imageScale(.large)
                            }
                            .buttonStyle(.plain)
                            
                            // MARK: - Editable
                            TextField("", text: Binding<String>(
                                get: {
                                    self.editingContents[task.id, default: task.content]
                                },
                                set: { newValue in
                                    self.editingContents[task.id] = newValue
                                }
                            ))
                            .onSubmit {
                                updateTask(task, with: self.editingContents[task.id, default: task.content])
                            }
                            .id(task.id)
                            .fontWeight(task.priority == .high ? .bold : .regular)
                            .foregroundStyle(task.completed ? .secondary : .primary)
                                                    

//                            Text("\(task.content)")
//                                .foregroundStyle(task.completed ? .secondary : .primary)
//                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Image(systemName: task.priority.imageName)
                                .foregroundStyle(task.completed ? .secondary : .primary)

                        }
                        .padding(.vertical, 8)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                modelContext.delete(task)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                Spacer()
                
                Picker("", selection: $newPriority) {
                    Image(systemName: "star.fill").tag(Priority.high)
                    Image(systemName: "star.fill.left").tag(Priority.medium)
                    Image(systemName: "star").tag(Priority.low)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TextField("New Task", text: $newTodoText)
                    .padding()
                    .submitLabel(.done)
                    .onSubmit {
                        addTodo(text: newTodoText, priority: newPriority)
                        newTodoText = ""
                    }
                
                Button(action: {
                    addTodo(text: newTodoText, priority: newPriority)
                    newTodoText = ""
                }) {
                    Text("A D D")
                        .font(.title3)
                        .disabled(newTodoText.isEmpty)
                        .padding()
                }
                
            }
            .navigationTitle("To do List")
        }
    }
    func addTodo(text: String, priority: Priority) {
        let newTodo: Task = Task(completed: false, content: text, priority: priority)
        modelContext.insert(newTodo)
    }
    func updateTask(_ task: Task, with newContent: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].content = newContent
            do {
                try modelContext.save()
            } catch {
                print("Failed to save the context: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
