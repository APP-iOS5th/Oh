//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 장예진 on 4/25/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            // root view of this content
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
