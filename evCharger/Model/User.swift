//
//  User.swift
//  evCharger
//
//  Created by Mihajlo Saric on 1.7.24..
//

import Foundation
import SwiftData

@Model
final class User {
    @Attribute(.unique) var id: UUID
    var email: String
    var name: String
    var lat: Double
    var lng: Double
    var isAdmin: Bool

    init(id: UUID = UUID(), email: String, name: String, lat: Double, lng: Double, isAdmin: Bool) {
        self.id = id
        self.email = email
        self.name = name
        self.lat = lat
        self.lng = lng
        self.isAdmin = isAdmin
    }
}
