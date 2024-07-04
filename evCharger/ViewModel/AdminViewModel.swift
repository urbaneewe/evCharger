//
//  AdminViewModel.swift
//  evCharger
//
//  Created by Mihajlo Saric on 1.7.24..
//

import SwiftUI
import Combine

//class AdminViewModel: ObservableObject {
//    @Published var chargers: [Charger] {
//        didSet {
//            dataStore.save()
//        }
//    }
//
//    private var dataStore = DataStore.shared
//
//    init() {
//        self.chargers = dataStore.chargers
//    }
//
//    func addCharger(type: String, lat: Double, lng: Double, availability: Bool) {
//        let charger = Charger(id: UUID(), type: type, lat: lat, lng: lng, availability: availability)
//        chargers.append(charger)
//    }
//}
