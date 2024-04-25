//
//  memoApp.swift
//  memo
//
//  Created by 어재선 on 4/22/24.
//

import SwiftUI

@main
struct memoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}
