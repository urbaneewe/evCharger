//
//  Charger.swift
//  evCharger
//
//  Created by Mihajlo Saric on 1.7.24..
//

import Foundation
import SwiftData

@Model
final class Charger: Identifiable {
    @Attribute(.unique) var id: UUID
    var type: String
    var lat: Double
    var lng: Double
    var availability: Bool
    var price: Double
    var chargingTime: Double
    
    init(id: UUID = UUID(), type: String, lat: Double, lng: Double, availability: Bool, price: Double, chargingTime: Double) {
        self.id = id
        self.type = type
        self.lat = lat
        self.lng = lng
        self.availability = availability
        self.price = price
        self.chargingTime = chargingTime
    }
}
