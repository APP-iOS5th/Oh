//
//  ContentView.swift
//  ProjectOnboard
//
//  Created by 장예진 on 4/29/24.
//



import SwiftUI
//main 으로 넘어가는 예시
struct MainView : View {
    var body : some View {
        Text("Welcome to LAB5 Paking APP")
        //main layout details 구냥 예시로
    }
}

struct ContentView: View {
    @State private var currentPage = 0
    @State private var showMainView = false
        
    var body: some View {
        // 메인 화면으로 바로 이동하는 경우를 처리
        if showMainView {
            MainView()
        } else {
            // 온보딩 화면을 표시
            TabView(selection: $currentPage) {
                ForEach(0..<4, id: \.self) { index in
                    OnboardingStepView(index: index, showMainView: $showMainView)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

    
    
//    //onboarding View
//
//    var body: some View {
//        TabView(selection: $currentPage) {
//            ForEach(0..<4, id : \.self) { index in
//                OnboardingStepView(index: index)
//            }
//        }
//        .tabViewStyle(PageTabViewStyle())
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//    }
//}

struct OnboardingStepView : View {
    var index : Int
    //binding 을 통해 메인 화면으로 전화하는 상태변수 선언
    @Binding var showMainView : Bool
    
    var body: some View {
        VStack {
            Image("onboardingImage") //예시 이미지 (3개를 각각 넣으면 좋을까? 어떻게?) 이건 나중에
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text(descriptionText)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            if index == 3 {
                Button("Let's Dig in! "){
                }
                .padding(.leastNormalMagnitude)
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
