//
//  ChargerDetailView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 2.7.24..
//

import SwiftUI

struct ChargerDetailView: View {
    @Environment(\.modelContext) private var context
    @State var charger: Charger

    var body: some View {
        Form {
            Section(header: Text("Type")) {
                TextField("Type", text: $charger.type)
            }

            Section(header: Text("Latitude")) {
                TextField("Latitude", value: $charger.lat, format: .number)
            }

            Section(header: Text("Longitude")) {
                TextField("Longitude", value: $charger.lng, format: .number)
            }

            Section(header: Text("Availability")) {
                Toggle(isOn: $charger.availability) {
                    Text("Available")
                }
            }

            Section(header: Text("Price")) {
                TextField("Price", value: $charger.price, format: .number)
            }

            Section(header: Text("Charging time")) {
                TextField("Charging time", value: $charger.chargingTime, format: .number)
            }

        }
        .navigationTitle("Charger Details")
        .navigationBarItems(trailing: Button("Save") {
            let newCharger = Charger(
                type: charger.type,
                lat: charger.lat,
                lng: charger.lng,
                availability: charger.availability,
                price: charger.price,
                chargingTime: charger.chargingTime
            )

            context.insert(newCharger)
        })
    }
}

struct ChargerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChargerDetailView(charger: Charger(type: "Type 1", lat: 0.0, lng: 0.0, availability: true, price: 0.0, chargingTime: 0.0))
    }
}
