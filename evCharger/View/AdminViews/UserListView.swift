//
//  UserListView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 2.7.24..
//

import SwiftUI
import SwiftData

struct UserListView: View {
    @Environment(\.modelContext) private var context
    @Query var users: [User]

    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    Text(user.name)
                        .swipeActions {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                context.delete(user)
                            }
                        }
                }
            }
        }
        .navigationTitle("Users")
        .navigationBarItems(trailing: NavigationLink(destination: UserDetailView(user: User(
            email: "",
            name: "",
            lat: 0,
            lng: 0,
            isAdmin: false
        ))) {
            Text("Add")
        })
    }
}

struct UserListView_Previews: PreviewProvider {
    @State static var users: [User] = []

    static var previews: some View {
        UserListView()
    }
}
