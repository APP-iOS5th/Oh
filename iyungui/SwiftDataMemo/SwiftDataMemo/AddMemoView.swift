//
//  AddMemoView.swift
//  SwiftDataMemo
//
//  Created by 이융의 on 4/22/24.
//

import SwiftUI
import SwiftData

struct AddMemoView: View {
    @Binding var memoTitle: String
    @Binding var memoText: String
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext

    var body: some View {
        VStack {
            TextField("", text: $memoTitle, prompt: Text("제목을 입력해주세요!").font(.headline).foregroundStyle(Color.gray))
                .padding(.vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                TextEditor(text: $memoText)
                    .font(.body)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.secondary.opacity(0.2), lineWidth: 1))
                    .frame(minHeight: 200)
                if memoText.isEmpty {
                    Text("메모를 입력해주세요.")
                        .foregroundColor(.gray)
                        .padding([.leading, .top], 20)
                        .allowsHitTesting(false)
                }
            }
            
            Button(action: {
                addMemo(title: memoTitle, text: memoText)
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("완료")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(6)
            }
        }
        .padding()
    }
    func addMemo(title: String, text: String) {
        let newMemo = Memo(title: title, text: text, createdDate: Date())
        modelContext.insert(newMemo)
    }
}

//#Preview {
//    AddMemoView()
//}

struct AddMemoView_Previews: PreviewProvider {
    @State static var memoTitle: String = ""
    @State static var memoText: String = ""
    
    static var previews: some View {
        AddMemoView(memoTitle: $memoTitle, memoText: $memoText)
    }
}
