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
    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add"){
                        print("add")
                    }
                    .padding(.trailing)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
