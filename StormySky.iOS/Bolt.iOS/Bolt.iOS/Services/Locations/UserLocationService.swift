//
//  UserLocationService.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 12/3/22.
//

import Foundation

protocol UserLocationServiceProtocol {
    func getUserLocations() async -> [UserLocation]
}

class UserLocationService: UserLocationServiceProtocol {
    func getUserLocations() async -> [UserLocation] {
        return [
            UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max"),
            UserLocation(id: 2, isSelected: false, city: "Phoenix", state: "AZ", latitude: 1.0, longitude: 1.0, lastTemp: 101, icon: "sun.max"),
            UserLocation(id: 3, isSelected: false, city: "Detroid", state: "MI", latitude: 1.0, longitude: 1.0, lastTemp: 72, icon: "sun.max")
        ]
    }
    
    
}
