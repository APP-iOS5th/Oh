//
//  JourneyListView.swift
//  Packing_ContentView
//
//  Created by 이융의 on 4/30/24.
//

import SwiftUI

struct Journey: Identifiable, Hashable {
    let id: UUID = UUID()
    let destination: String // 여행 목적지
    let activities: [String]    // 여행 활동 Array
    let image: String    //  여행 사진
    let startDate: Date // 여행 시작 날짜
    let endDate: Date   // 여행 끝 날짜
    
    var duration: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return "\(formatter.string(from: startDate)) - \(formatter.string(from: endDate))"
    }
}

extension Journey {
    static let sample: [Journey] = [
        Journey(destination: "다낭", activities: ["바다", "해변"], image: "다낭", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 5)),
        Journey(destination: "가평", activities: ["글램핑", "캠핑"], image: "가평", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 7)),
        Journey(destination: "사하라 사막", activities: ["배낭여행", "사막"], image: "사하라사막", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 3))
    ]
}


struct JourneyListView: View {
    var journeys = Journey.sample
    
    var body: some View {
        NavigationStack {
            List(journeys) { journey in
                NavigationLink(value: journey) {
                    JourneySummaryView(journey: journey)
                }
            }
            .navigationDestination(for: Journey.self) { journey in
                JourneyDetailView(journey: journey)
            }
        }
    }
}

struct JourneySummaryView: View {
    var journey: Journey
    var body: some View {
        Text("Hello, World!")
    }
}

struct JourneyDetailView: View {
    var journey: Journey
    
    var body: some View {
        Text("")
    }
}

#Preview {
    JourneyListView()
}
