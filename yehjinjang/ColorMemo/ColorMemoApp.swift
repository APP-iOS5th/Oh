//
//  ColorMemoApp.swift
//  ColorMemo
//
//  Created by 장예진 on 4/23/24.
//

import SwiftUI
import SwiftData

@main
struct ColorMemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}
