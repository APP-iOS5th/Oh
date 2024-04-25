//
//  ContentView.swift
//  TodoList
//
//  Created by 이융의 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var todoText: String = ""
    var tasks: [Task] = Task.tasks
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(tasks, id: \.id) { task in
                        HStack(spacing: 20) {
                            Image(systemName: task.completed ? "circle.inset.filled" : "circle")
                            Text("\(task.description)")
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationTitle("To do List")
            .toolbar {
                Button(action: {
                    
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
