//
//  MememoAppApp.swift
//  MememoApp
//
//  Created by 김영훈 on 4/22/24.
//

import SwiftUI

@main
struct MememoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}
