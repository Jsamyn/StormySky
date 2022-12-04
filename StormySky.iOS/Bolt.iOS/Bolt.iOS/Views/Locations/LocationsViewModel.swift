//
//  LocationsViewModel.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 12/3/22.
//

import Foundation

/**
 Possible states of the locations page UI
 */
struct LocationsState {
    var locations: [UserLocation] = []
}

/**
 Possible input events
 */
enum LocationsInput {
    case load
    case addLocation
}

class LocationsViewModel: ViewModel {
    
    @Published
    var state: LocationsState
    
    init() {
        state = LocationsState(locations: [UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max")])
    }
    
    func trigger(_ input: LocationsInput) {
        switch(input) {
        case .load:
            print("Loading..")
        case .addLocation:
            print("Adding location..")
        }
    }
    
    
}
