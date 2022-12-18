//
//  Locations.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/19/22.
//

// TODO: Refactor LocationList into a separate view for testability

import SwiftUI

struct Locations: View {
    
    
    @ObservedObject var vm: LocationsViewModel
    
    init(locationsService: UserLocationServiceProtocol){
        self.vm = LocationsViewModel(locationService: locationsService)
    }
    
 
    var body: some View {
        VStack {
            /* Title */
            Text("Locations")
                .font(.title)
                .padding()
                .accessibilityIdentifier("locations_title")
            
            /* Location List */
            LocationsList(locations: self.vm.state.locations)
            .accessibilityIdentifier("locations_list")
            
            /* Add Button */
            Button(action: add) {
                Image(systemName: "plus")
                    .foregroundColor(Color("Primary"))
            }
            .frame(width: 40, height: 40)
            .background(Color("PrimaryDark"))
            .clipShape(Circle())
            .padding()
            .accessibilityIdentifier("add_button")
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .onAppear{
            Task {
                await vm.trigger(LocationsInput.load)
            }
        }
    }
    
    /* Methods */
    private func add() -> Void {
        print("Adding City..")
    }
}

#if !TESTING
struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations(locationsService: UserLocationService())
    }
}
#endif
