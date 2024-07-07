//
//  HaversineFormula.swift
//  evCharger
//
//  Created by Mihajlo Saric on 7.7.24..
//

import Foundation
import CoreLocation

func haversineDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let earthRadius = 6371.0 // In km
    let dLat = (lat2 - lat1).degreesToRadians
    let dLon = (lon2 - lon1).degreesToRadians

    let a = sin(dLat / 2) * sin(dLat / 2) +
            cos(lat1.degreesToRadians) * cos(lat2.degreesToRadians) *
            sin(dLon / 2) * sin(dLon / 2)

    let c = 2 * atan2(sqrt(a), sqrt(1 - a))

    return earthRadius * c
}

extension Double {
    var degreesToRadians: Double { self * .pi / 180 }
}

