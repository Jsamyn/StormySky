//
//  LocationsViewModel.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 12/3/22.
//

import Foundation


/// Possible states of the locations page UI
struct LocationsState {

    /// List of user locations
    var locations: [UserLocation] = []
    
    /// Determines if AddLocationModal is visible on screen
    var addLocationsVisible: Bool = false
    
    /// Bindable text property for adding new locations on AddLocationModal
    var locationsText: String = ""
    
    /// Error text displayed on AddLocationsModal
    var locationsErrorText: String = ""
}


class LocationsViewModel: ViewModel {
    
    @Published
    var state: LocationsState
    
    /* IoC Properties */
    private let locationsService: UserLocationServiceProtocol
    
    /* Constants */
    let zipCodeImproperLength = "Zip code needs to be 5 digits."
    
    /* Initializers */
    init(locationService: UserLocationServiceProtocol) {
        self.locationsService = locationService
        self.state = LocationsState()
    }
    
    
    /* Public Methods */
    
    /// Add location into users saved locations
    func addLocation() {
        guard self.validate(input: state.locationsText) else {
            print("Adding location..")
            return
        }
    }
    
    
    ///  Load users locations from storage
    @MainActor func loadLocations() async -> Void {
        state.locations = await locationsService.getUserLocations()
    }
    
    /// Toggle display of addLocationModal
    func toggleAddLocationModal() -> Void {
        state.addLocationsVisible.toggle()
        self.resetModalFields()
    }
    
    /* Private Methods */
    
    /// Validate locations text input matches requirements for new locations
    /// - Parameters:
    ///     - input: text string to validate
    private func validate(input: String) -> Bool {
        if (input.count != 5) {
            state.locationsErrorText = self.zipCodeImproperLength
        }
        else {
            state.locationsErrorText = ""
        }
        
        
        return !state.locationsErrorText.isEmpty
    }
    
  
    /// Reset text fields in modal when it is dismissed from screen
    private func resetModalFields() {
        state.locationsText = ""
        state.locationsErrorText = ""
    }
    
}
