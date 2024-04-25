//
//  EditingTaskView.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI

struct EditingTaskView: View {
    @Binding var isSheetShowing:Bool
    var body: some View {
        VStack {
            List {
                Button("close"){
                    isSheetShowing = false
                }
            }
        }
    }
}
