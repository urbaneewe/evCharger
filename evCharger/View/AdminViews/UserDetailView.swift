//
//  UserDetailView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 2.7.24..
//

import SwiftUI

struct UserDetailView: View {
    @Environment(\.modelContext) private var context
    @State var user: User

    var body: some View {
        Form {
            Section(header: Text("Email")) {
                TextField("Email", text: $user.email)
            }

            Section(header: Text("Name")) {
                TextField("Name", text: $user.name)
            }

            Section(header: Text("Latitude")) {
                TextField("Latitude", value: $user.lat, format: .number)
            }

            Section(header: Text("Longitude")) {
                TextField("Longitude", value: $user.lng, format: .number)
            }

            Section(header: Text("Admin")) {
                Toggle(isOn: $user.isAdmin) {
                    Text("Admin")
                }
            }
        }
        .navigationTitle("User Details")
        .navigationBarItems(trailing: Button("Save") {
            let newUser = User(
                email: user.email,
                name: user.name,
                lat: user.lat,
                lng: user.lng,
                isAdmin: user.isAdmin
            )

            context.insert(newUser)
        })
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(email: "example@example.com", name: "John Doe", lat: 0.0, lng: 0.0, isAdmin: false))
    }
}
