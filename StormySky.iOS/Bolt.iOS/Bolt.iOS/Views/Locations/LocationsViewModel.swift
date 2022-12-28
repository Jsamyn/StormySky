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
    var addLocationsVisible: Bool = false
    var locationsText: String = ""
    var addLocationErrorVisible: Bool = false
    var addLocationErrorText: String = ""
}

/**
 Possible input events
 */
enum LocationsInput {
    case load
    case toggleModal
    case validateLocationsText
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
            
        case .toggleModal:
            await toggleAddLocationModal()
            
        case .validateLocationsText:
            await validateLocationsText()
        }
    }
    
    /* Private Input Methods */
    /**
     Load users locations from storage
     */
    @MainActor private func loadLocations() async -> Void {
        state.locations = await locationsService.getUserLocations()
    }
    
    /**
     Toggle display of addLocationModal
     */
    @MainActor private func toggleAddLocationModal() async -> Void {
        state.addLocationsVisible.toggle()
    }
    
    /**
     Toggle display of error text and display proper error text string to user
     */
    @MainActor private func validateLocationsText() async -> Void {
        if self.state.locationsText.count < 5 {
            self.state.addLocationErrorVisible = true
        }
    }
    
}
