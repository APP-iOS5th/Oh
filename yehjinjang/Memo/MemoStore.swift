//
//  MemoStore.swift
//  Memo
//
//  Created by 장예진 on 4/22/24.
//

import SwiftUI
import SwiftData

// memo 모델을 내용 색상 생성 날짜 포함
// 메모 정의스트럵ㅌ, Identifiable 프로토콜 준수
@Model
class Memo {
    var id: UUID = UUID()       // 각 메모에 대해 고유 식별자 자동 생성
    var text: String            // 메모의 텍스트 내용
//    var color: Color            // 메모에 연결된 색상
    var created: Date = Date()  // 메모 생성 날짜
    
    init(text: String, created: Date){
        self.text = text
//        self.color = color
        self.created = created
    }

    // 생성 날짜를 문자열로 반환하는 계산 속성
    var createdString: String {
        get{
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
}

//// 메모들을 저장하고 관리하는 클래스
//class MemoStore: ObservableObject {
//    @Published var memos: [Memo] = []  // 메모 배열, 변경사항을 관찰하도록 설정
//
//    // 새 메모 추가 함수
//    func addMemo(_ text: String, color: Color) {
//        let memo = Memo(text: text, color: color)
//        memos.insert(memo, at: 0)  // 배열의 시작 부분에 새 메모 삽입
//    }
//
//    // 지정된 메모 제거 함수
//    func removeMemo(_ targetMemo: Memo) {
//        if let index = memos.firstIndex(where: { $0.id == targetMemo.id }) {
//            memos.remove(at: index)  // 배열에서 메모 제거
//        }
//    }
//}
class MemoStore: ObservableObject {
    @Query var memos: [Memo] = []
    @Environment(\.modelContext) var modelContext
    
    func addMemo(_ text: String, color: Color) {
        let memo: Memo = Memo(text: text, created: Date())
        modelContext.insert(memo)
    }
    func removeMemo(_ targetMemo: Memo) {
        if memos.firstIndex(where: { $0.id == targetMemo.id }) != nil {
            modelContext.delete(targetMemo)
        }
    }
}
