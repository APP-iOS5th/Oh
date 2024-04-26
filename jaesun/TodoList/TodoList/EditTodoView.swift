//
//  EditTodoView.swift
//  TodoList
//
//  Created by 어재선 on 4/25/24.
//

import SwiftUI

struct EditTodoView: View {
    @State var editDescription: String = ""
    @State var task: Task
    var body: some View {
        NavigationStack {
            List{
                Text("\(task.description)")
                TextField("변경할 내용",text: $editDescription)
            }

            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("변경"){
                        //TODO: 변경 누르면 갑 저장
                        task.description = editDescription
                        print(editDescription)
                        print(task.description)
                    }
                }
            }
        }
    }
}

#Preview {
    EditTodoView(task: Task.tasks[0])
}
