//
//  MemoDetailView.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import SwiftUI

struct MemoDetailView: View {
    let memo: Memo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(memo.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding([.horizontal, .bottom])

                Text(memo.text)
                    .font(.body)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                Spacer()
            }
            .offset(y: -40)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(memo.color)
        .ignoresSafeArea(edges: .bottom)
    }
}
