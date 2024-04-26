//
//  ContentView.swift
//  TodoList
//
//  Created by 어재선 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var isSheetShowing: Bool = false
    @Binding var tasks: [Task]
    var body: some View {
        NavigationStack{
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    
                    NavigationLink(destination: EditTodoView(task: tasks[index])) {
                        Text("\(tasks[index].description)")
                    }
                }
            }
            .navigationTitle("TodoList")
            .toolbar{
                Button{
                    isSheetShowing = true
                } label: {
                    Text("추가")
                }
            }.sheet(isPresented: $isSheetShowing){
                AddTodoView(isSheetShowing: $isSheetShowing)
            }
        }
    }
    
}


struct AddTodoView: View {
    @Binding var isSheetShowing: Bool
    @State var todo: String = ""
    @State var priority: Priority = .medium
//    @State var choosePrioritys: Priority
    
    var body: some View {
        VStack {
            HStack{
                Button("취소") {
                    isSheetShowing = false
                }
                Spacer()
                Button{
                    isSheetShowing = false
                    Task.tasks.insert(Task(completed: false, description: todo, priority: priority), at: 0)

                } label: {
                    Text("완료")
                }.disabled(todo.isEmpty)
            }
            .padding()
            Spacer()
            List {
                TextField("할 일", text: $todo)
                Picker("중요도",selection: $priority){
                    Text("high").tag(Priority.high)
                    Text("mideum").tag(Priority.medium)
                    Text("low").tag(Priority.low)
                    
                }
            }
        }
    }
}


#Preview {
    ContentView(tasks: .constant(Task.tasks))
}

