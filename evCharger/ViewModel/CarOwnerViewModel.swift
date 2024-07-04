//
//  CarOwnerViewModel.swift
//  evCharger
//
//  Created by Mihajlo Saric on 1.7.24..
//

import SwiftUI
import Combine

//class CarOwnerViewModel: ObservableObject {
//    @Published var optimalCharger: Charger?
//
////    private var dataStore = DataStore.shared
//
//    func requestCharging(userLat: Double, userLng: Double, chargerType: String) {
//        let chargers = dataStore.chargers.filter { $0.type == chargerType && $0.availability }
//        optimalCharger = chargers.min(by: { calculateDistance($0.lat, $0.lng, userLat, userLng) < calculateDistance($1.lat, $1.lng, userLat, userLng) })
//    }
//
//    private func calculateDistance(_ lat1: Double, _ lng1: Double, _ lat2: Double, _ lng2: Double) -> Double {
//        let R = 6371.0
//        let dLat = (lat2 - lat1) * .pi / 180
//        let dLng = (lng2 - lng1) * .pi / 180
//        let a = sin(dLat / 2) * sin(dLat / 2) +
//                cos(lat1 * .pi / 180) * cos(lat2 * .pi / 180) *
//                sin(dLng / 2) * sin(dLng / 2)
//        let c = 2 * atan2(sqrt(a), sqrt(1 - a))
//        return R * c
//    }
//}
