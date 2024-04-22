//
//  ContentView.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var memos: [Memo]
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    ContentView()
}
