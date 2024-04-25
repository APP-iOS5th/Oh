//
//  ContentView.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI

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
    @State private var tasks: [Task] = Task.tasks
    @State private var text: String = ""
    var body: some View {
        NavigationStack {
            HStack {
                TextField("New Task", text: $text)
                    .padding()
                    .border(.gray)
                Button("add") {
                    if !text.isEmpty {
                        let newTask = Task(completed: false, description: text, priority: .medium)
                        tasks.append(newTask)
                        text = ""
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
            }
            .padding()
            List {
                ForEach(tasks){task in
                    Button {
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                    tasks[index].completed.toggle()
                                }
                    } label: {
                        Label {
                            Text(task.description)
                                .tint(.black)
                                .modifier(StrikethroughModifier(strikethrough: task.completed))
                        } icon: {
                            task.completed ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    tasks.remove(atOffsets: indexSet)
                })
                .padding()
                .contextMenu {
                    Button {
                        print("remove")
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
