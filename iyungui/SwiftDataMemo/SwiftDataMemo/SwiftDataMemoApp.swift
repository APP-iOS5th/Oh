//
//  SwiftDataMemoApp.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataMemoApp: App {
    // ModelContainer는 주어진 스키마에서 데이터베이스를 생성하고, 디스크의 읽기 및 쓰기와 iCloud 동기화를 담당
    var modelContainer: ModelContainer = {
        // ModelContainer를 생성하려면 우선 사용할 모델들을 스키마로 만들어준다.
        let schema = Schema([Memo.self, Tag.self])
        // 모델 관리 규칙을 설정
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
}
