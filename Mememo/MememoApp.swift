//
//  MememoApp.swift
//  Mememo
//
//  Created by Mac on 4/22/24.
//

import SwiftUI

@main
struct MememoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}
