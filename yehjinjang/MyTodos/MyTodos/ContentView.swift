//
//  ContentView.swift
//  MyTodos
//
//  Created by 장예진 on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showCreate = false
    @Query private var items : [ToDoItem]
    
    var body: some View {
        
        
        NavigationStack {
            List {
                ForEach(items){ item in
                    HStack(alignment: .leading) {
                        if item.isCritical{
                            Image(systemName: "exclamationmark.3")
                                .symbolVariant(.fill)
                                .foregroundColor(.red)
                                .font(.largeTitle)
                                .bold()
                        }
                        Text(item.title)
                            .font(.largeTitle)
                            .bold()
                        Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                            .font(.callout)
                    }
                    Spacer()
                    
                    Button{
                        
                    } label :{
                        Image(systemName: "checkmark")
                            .symbolVariant(.circle.fill)
                            .foregroundStyle(item.isCompleted ? .green : .gray)
                            .font(.largeTitle)
                    }
                    .buttonStyle(.plain)
                }
                
            }
        }
        .navigationTitle("My ToDo List")
        .toolbar {
            ToolbarItem{
                Button(action: {
                    showCreate.toggle()
                }, label: {
                    Label("Add Item", systemImage: "plus")
                })
            }
        }
        .sheet(isPresented: $showCreate, content: {
            NavigationStack{
                CreateView()
            }
            .presentationDetents([.medium])
        })
    }
    VStack {
        
    }
}

#Preview {
    ContentView()
}
