//
//  StrikethroughModifier.swift
//  ToDoListApp
//
//  Created by 김영훈 on 4/25/24.
//

import SwiftUI

struct StrikethroughModifier: ViewModifier {
    let strikethrough: Bool
    
    func body(content: Content) -> some View {
        if strikethrough {
            return AnyView(content.strikethrough())
        } else {
            return AnyView(content)
        }
    }
}
