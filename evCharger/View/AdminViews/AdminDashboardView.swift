//
//  AdminDashboardView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 2.7.24..
//

import SwiftUI

struct AdminDashboardView: View {

    var body: some View {
            List {
                Section(header: Text("Chargers")) {
                    NavigationLink(destination: ChargerListView()) {
                        Text("Manage Chargers")
                    }
                }

                Section(header: Text("Users")) {
                    NavigationLink(destination: UserListView()) {
                        Text("Manage Users")
                    }
                }
            }
            .navigationTitle("Admin Dashboard")
    }
}

struct AdminDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        AdminDashboardView()
    }
}
