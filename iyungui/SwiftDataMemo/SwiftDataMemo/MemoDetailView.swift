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
                    .padding([.horizontal, .bottom])

                Text(memo.text)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                Spacer()
            }
            .offset(y: -40)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
