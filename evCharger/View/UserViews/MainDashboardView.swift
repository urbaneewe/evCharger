//
//  MainDashboardView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 7.7.24..
//

import SwiftUI
import SwiftData

struct MainDashboardView: View {
    @Query var users: [User]
    @Query var chargers: [Charger]

    @EnvironmentObject var userSession: UserSession

    var body: some View {
        if let user = userSession.loggedInUser {
            Text("Welcome \(user.name)")
        } else {
            Text("No user")
        }
    }
}

#Preview {
    MainDashboardView()
}
