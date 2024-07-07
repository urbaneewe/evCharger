//
//  BookChargingView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 7.7.24..
//

import SwiftUI

struct BookChargingView: View {
    @Environment(\.modelContext) private var viewContext
    var charger: Charger

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Type:")
                    .font(.headline)
                Spacer()
                Text(charger.type)
                    .font(.body)
            }
            .padding(.horizontal)

            Divider()

            HStack {
                Text("Availability:")
                    .font(.headline)
                Spacer()
                Text(charger.availability ? "Available" : "Not Available")
                    .font(.body)
                    .foregroundColor(charger.availability ? .green : .red)
            }
            .padding(.horizontal)

            Divider()

            HStack {
                Text("Price:")
                    .font(.headline)
                Spacer()
                Text("\(charger.price, specifier: "%.2f")$")
                    .font(.body)
            }
            .padding(.horizontal)

            Divider()

            HStack {
                Text("Charging Time:")
                    .font(.headline)
                Spacer()
                Text("\(charger.chargingTime, specifier: "%.2f") hours")
                    .font(.body)
            }
            .padding(.horizontal)

            Spacer()

            if charger.availability {
                Button(action: {
                    charger.availability = false
                    try? viewContext.save()
                }) {
                    Text("Book charging")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } else {
                Text("This charger is currently not available for booking.")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Book charging")
    }
}

struct BookChargingView_Previews: PreviewProvider {
    static var previews: some View {
        BookChargingView(charger: Charger(id: UUID(), type: "Type 1", lat: 0.0, lng: 0.0, availability: true, price: 10.0, chargingTime: 2.0))
    }
}

