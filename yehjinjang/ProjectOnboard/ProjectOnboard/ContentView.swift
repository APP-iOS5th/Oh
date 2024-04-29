//
//  ContentView.swift
//  ProjectOnboard
//
//  Created by 장예진 on 4/29/24.
//

import SwiftUI

struct ContentView : View {
    @State private var currentPage = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<4, id : \.self) { index in
                OnboardingStepView(index: index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingStepView : View {
    var index : Int
    
    var body: some View {
        VStack {
            Image("onboarding")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(descriptionText)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            if index == 3 {
                Button("Let's Dig in!"){
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var descriptionText: String {
        switch index {
        case 0:
            return "Get Organized \n 여행 준비를 한눈에! 여행 목적지와 활동에 맞춰 필요한 물품을 추천받으세요."
        case 1:
            return "Personalized Suggestions \n목적지와 일정에 따라 맞춤 패킹 리스트를 생성하고, 친구들과 공유하여 여행 준비를 더욱 쉽게!"
        case 2:
            return "Pack Together \n친구들과 패킹 리스트를 공유하고, 누가 무엇을 가져갈지 실시간으로 조율하세요."
        case 3:
            return "Enjoy Your Trip"
        default:
            return ""
        }
    }
}

#Preview {
    ContentView()
}
