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
}

class LocationsViewModel: ViewModel {
    
    @Published
    var state: LocationsState
    
    private let locationsService: UserLocationServiceProtocol
    
    init(locationService: UserLocationServiceProtocol) {
        self.locationsService = locationService
        self.state = LocationsState()
    }
    
    /**
     Handle user input into the view
     
     - Parameters:
        - input: input action being performed
     */
    func trigger(_ input: LocationsInput) async {
        switch(input) {
        case .load:
            await loadLocations()
        }
    }
    
    /* Private Methods */
    @MainActor private func loadLocations() async -> Void {
        state.locations = await locationsService.getUserLocations()
    }
}
