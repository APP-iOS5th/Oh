//
//  ContentView.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var tasks: [Task]
    @Environment(\.modelContext) var modelContext
    @State private var text: String = ""
    @State private var priority: Priority = .medium
    @FocusState private var isTextFieldFocused: Bool
    @State private var isSheetShowing: Bool = false
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
                    .focused($isTextFieldFocused)
                Button("add") {
                    if !text.isEmpty {
                        let newTask = Task(completed: false, taskDescription: text, priority: priority)
                        modelContext.insert(newTask)
                        text = ""
                        isTextFieldFocused = false
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
                                    isSheetShowing = true
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
            .sheet(isPresented: $isSheetShowing) {
                EditingTaskView(isSheetShowing: $isSheetShowing)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self)
}
