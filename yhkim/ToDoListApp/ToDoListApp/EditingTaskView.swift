//
//  EditingTaskView.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI

struct EditingTaskView: View {
//    @Binding var isSheetShowing:Bool
    @State var isSheetShowing: Bool = true
    @State var text:String = "test"
    @State var priority: Priority = .medium
    @FocusState var isTextFieldFocused: Bool
    var body: some View {
        VStack {
            HStack {
                Button("취소") {isSheetShowing = false}
                Spacer()
                Button("완료") {
                    
                }
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
                        .focused($isTextFieldFocused)
                }
            }
        }
    }
}

#Preview {
    EditingTaskView()
}
