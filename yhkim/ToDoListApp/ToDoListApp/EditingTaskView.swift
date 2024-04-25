//
//  EditingTaskView.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI

struct EditingTaskView: View {
    @Binding var task: Task?
    @Binding var isSheetShowing: Bool
    @Binding var text: String
    @Binding var priority: Priority
    var body: some View {
        VStack {
            HStack {
                Button("취소") {isSheetShowing = false}
                Spacer()
                Button("완료") {
                    if let editingTask = task {
                        editingTask.taskDescription = text
                        editingTask.priority = priority
                    } else {
                        print("error")
                    }
                    isSheetShowing = false
                }
                .disabled(text.isEmpty)
            }
            .padding()
            List {
                HStack {
                    Picker("",selection: $priority) {
                        Text("High").tag(Priority.high)
                        Text("Medium").tag(Priority.medium)
                        Text("Low").tag(Priority.low)
                    }
                    .pickerStyle(.menu)
                    .frame(width: 100)
                    TextField("New Task", text: $text)
                        .padding()
                        .border(.gray)
                }
            }
        }
    }
}
