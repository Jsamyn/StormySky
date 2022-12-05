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
    var state: LocationsState = LocationsState()
    
    private let locationsService: UserLocationService
    
    init() {
        locationsService = UserLocationService()
    }
    
    /**
     Handle user input into the view
     
     - Parameters:
        - input: input action being performed
     */
    func trigger(_ input: LocationsInput) {
        switch(input) {
        case .load:
            Task {
                await loadLocations()
            }
        case .addLocation:
            print("Adding location..")
        }
    }
    
    /* Private Methods */
    @MainActor private func loadLocations() async -> Void {
        state.locations = await locationsService.getUserLocations()
    }
}
