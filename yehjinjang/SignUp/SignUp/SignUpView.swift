//
//  SignUpView.swift
//  SignUp
//
//  Created by 장예진 on 4/26/24.
import SwiftUI

struct Address {
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
}

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var address2 = Address()
    @State private var lessThenTwo = false
    @State private var username = ""
    @State private var password = ""
    @State private var usernameErrorMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Names") {
                    TextField("First Name", text: $firstName)
                    if !usernameErrorMessage.isEmpty {
                        Text(usernameErrorMessage)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                    TextField("Last Name", text: $lastName)
                }
                
                Section("Current Address") {
                    TextField("Street Address", text: $address.street)
                    TextField("City", text: $address.city)
                    TextField("Postal Code", text: $address.postalCode)
                    Toggle(isOn: $lessThenTwo) {
                        Text("Have you lived here for 2+ years")
                    }
                }
                
                if !lessThenTwo {
                    Section("Previous Address") {
                        TextField("Street Address", text: $address2.street)
                        TextField("City", text: $address2.city)
                        TextField("Postal Code", text: $address2.postalCode)
                    }
                }
                
                Section {
                    TextField("Create Username", text: $username)
                    SecureField("Create Password", text: $password)
                }
                
                Button("Submit") {
                    usernameErrorMessage = "Username 을 입력하세요."
                    print("Form submit action here")
                }
            }
            .navigationTitle("Sign Up")
        }
        
    }
}

#Preview {
    SignUpView()
}
