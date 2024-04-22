//
//  MemoDetailView.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import SwiftUI

struct MemoDetailView: View {
    let memo: Memo
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(memo.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding([.horizontal, .bottom])
                
//                Text(memo.createdString)
//                    .font(.caption)
//                    .foregroundStyle(Color.white.opacity(0.7))
//                    .padding([.horizontal, .bottom])

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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
}
//
//#Preview {
//    MemoDetailView(memo: Memo(title: "Title", text: "Text", colorHex: "", createdDate: Date()))
////}
//#Preview {
//    MemoDetailView()
//}
