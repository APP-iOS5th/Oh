//
//  ContentView.swift
//  Calculator
//
//  Created by 어재선 on 4/18/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Text("2+3")
            // 첫번째 줄
            HStack{
                Button{
                    
                } label: {
                    Text("7")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("8")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("9")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button {
                    
                } label: {
                    Text("/")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }

            }
            // 두번째 줄
            HStack{
                Button{
                    
                } label: {
                    Text("4")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("5")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("6")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button {
                    
                } label: {
                    Text("*")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
            }
            // 세번째 줄
            HStack{
                Button{
                    
                } label: {
                    Text("1")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("2")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("3")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button {
                    
                } label: {
                    Text("+")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }

            }
            // 네번째 줄
            HStack{
                Button{
                    
                } label: {
                    Text(".")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("0")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                Button{
                    
                } label: {
                    Text("C")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                
                Button {
                    
                } label: {
                    Text("+")
                        .bold()
                        .padding(19)
                        .border(Color.black)
                }
                
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
