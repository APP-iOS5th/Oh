//
//  EditTodoView.swift
//  TodoList
//
//  Created by 어재선 on 4/25/24.
//

import SwiftUI

struct EditTodoView: View {
    @State var editDescription: String = ""
    var body: some View {
        NavigationStack {
            List{
                Text("기존 내용")
                TextField("변경할 내용",text: $editDescription)
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("변경"){
                        //TODO:
                    }
                }
            }
        }
    }
}

#Preview {
    EditTodoView()
}
