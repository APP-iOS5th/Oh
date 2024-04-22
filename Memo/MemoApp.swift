//
//  MemoApp.swift
//  Memo
//
//  Created by 장예진 on 4/22/24.

import SwiftUI

@main
struct MemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}

//            ContentView(memoStore: MemoStore())
