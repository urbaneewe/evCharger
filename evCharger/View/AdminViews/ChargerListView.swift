//
//  ChargerListView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 2.7.24..
//

import SwiftUI
import SwiftData

struct ChargerListView: View {
    @Environment(\.modelContext) private var context
    @Query var chargers: [Charger]

    var body: some View {
        List {
            ForEach(chargers) { charger in
                NavigationLink(destination: ChargerDetailView(charger: charger)) {
                    Text(charger.type)
                        .swipeActions {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                context.delete(charger)
                            }
                        }
                }
            }
        }
        .navigationTitle("Chargers")
        .navigationBarItems(trailing: NavigationLink(destination: ChargerDetailView(charger: Charger(
            type: "",
            lat: 0,
            lng: 0,
            availability: true,
            price: 0,
            chargingTime: 0
        ))) {
            Text("Add")
        })
    }
}

struct ChargerListView_Previews: PreviewProvider {
    @State static var chargers: [Charger] = []

    static var previews: some View {
        ChargerListView()
    }
}

