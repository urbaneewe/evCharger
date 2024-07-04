//
//  SignUpView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 1.7.24..
//

import SwiftUI
import SwiftData

struct SignUpView: View {
    @Environment(\.modelContext) private var context

    @State private var email: String = ""
    @State private var name: String = ""
    @State private var lat: Double = 0
    @State private var lng: Double = 0
    @State private var isAdmin: Bool = false

    @Query var users: [User]

    var body: some View {
        VStack() {
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            TextField("Name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            Toggle("Admin", isOn: $isAdmin)
                .padding(.bottom, 20)

            Button(action: saveUser) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }

            List {
                ForEach(users) { user in
                    HStack {
                        Text(user.email)
                        Spacer()
                        Text(user.name)
                        Spacer()
                        Text("\(user.isAdmin)")
                    }
                }
            }
        }
        .padding()
    }

    private func saveUser() {
        let newUser = User(id: UUID(), email: email,name: name, lat: lat, lng: lng, isAdmin: isAdmin)

        context.insert(newUser)

        email = ""
        name = ""
        lat = 0
        lng = 0
        isAdmin = false
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
