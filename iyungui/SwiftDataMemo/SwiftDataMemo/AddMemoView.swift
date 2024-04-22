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
    @Binding var memoColor: Color
    let colors: [Color]
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    enum Field: Hashable {
        case memoTitle
        case memoText
    }
    
    @FocusState private var focusedField: Field?
    @FocusState private var IsFocused: Bool

    
    var body: some View {
        VStack {
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button { memoColor = color } label: {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding().frame(height: 50).foregroundStyle(Color.white).background(color).shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            
            Divider().padding()
            
            TextField("", text: $memoTitle)
                .font(.title)
                .padding(8)
                .focused($focusedField, equals: .memoTitle)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .memoText
                }

            TextEditor(text: $memoText)
                .font(.body)
                .padding(8)
                .focused($focusedField, equals: .memoText)
            
            Spacer()

        }
        .onAppear {
            focusedField = .memoTitle
        }
        .onTapGesture {
            focusedField = nil
        }
        .padding()
        .navigationTitle("New Memo")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    addMemo(title: memoTitle, text: memoText, color: memoColor)
                    dismiss()
                }
                .disabled(memoText.isEmpty)
            }
        }
    }
    func addMemo(title: String, text: String, color: Color) {
        if let rgba = color.rgba() {
            let hexString = String(format: "%02X%02X%02X", Int(rgba.red * 255), Int(rgba.green * 255), Int(rgba.blue * 255))
            let newMemo = Memo(title: title, text: text, colorHex: hexString, createdDate: Date())
            modelContext.insert(newMemo)
        }

    }
}
