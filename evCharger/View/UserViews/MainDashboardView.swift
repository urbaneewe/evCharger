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

    var sortedChargers: [Charger] {
        guard let user = userSession.loggedInUser else { return [] }
        return chargers.sorted {
            if $0.availability == $1.availability {
                return haversineDistance(lat1: user.lat, lon1: user.lng, lat2: $0.lat, lon2: $0.lng) <
                       haversineDistance(lat1: user.lat, lon1: user.lng, lat2: $1.lat, lon2: $1.lng)
            } else {
                return $0.availability && !$1.availability
            }
        }
    }

    var body: some View {
        if let user = userSession.loggedInUser {
            VStack {
                Text("Chargers are sorted by proximity to your location.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)

                List(sortedChargers) { charger in
                    if charger.availability {
                        NavigationLink(destination: BookChargingView(charger: charger)) {
                            ChargerRowView(charger: charger)
                        }
                    } else {
                        ChargerRowView(charger: charger)
                    }
                }
            }
            .navigationTitle("Welcome \(user.name)!")
        }
    }
}

struct ChargerRowView: View {
    var charger: Charger

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Type: \(charger.type)")
                HStack {
                    Text("Availability: ")
                    if charger.availability {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    MainDashboardView()
        .environmentObject(UserSession())
}
