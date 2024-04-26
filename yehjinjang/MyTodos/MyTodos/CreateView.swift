//
//  CreateView.swift
//  MyTodos
//
//  Created by 장예진 on 4/25/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item  = ToDoItem()
    
    var body: some View {
        List{
            TextField("task", text: .constant(""))
            DatePicker("Choose a  date",
                       selection: .constant(.now))
            Toggle("Important?", isOn: .constant(false))
            Button("add"){
                withAnimation{
                    context.insert(item)
                }
                
                dismiss()
                
            }
        }
        .navigationTitle("add ToDo")
    }
}

#Preview {
    CreateView()
}
