//
//  LocationsList.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 12/13/22.
//

import SwiftUI


struct LocationsList: View {
    var locations: [UserLocation]
    
    init (locations: [UserLocation]) {
        self.locations = locations
    }
    
    var body: some View {
        VStack {
            ForEach(self.locations) { loc in
                LocationCell(location: loc)
                    .accessibilityIdentifier("loc_\(loc.id)")
            }
        }
    }
    
}


#if !TESTING
struct LocationsList_Preview: PreviewProvider {
    
    static var previews: some View {
        
        let locations = [
            UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max"),
            UserLocation(id: 2, isSelected: false, city: "Phoenix", state: "AZ", latitude: 1.0, longitude: 1.0, lastTemp: 101, icon: "sun.max"),
            UserLocation(id: 3, isSelected: false, city: "Detroid", state: "MI", latitude: 1.0, longitude: 1.0, lastTemp: 72, icon: "sun.max")
            
        ]
        LocationsList(locations: locations)
    }
    
}
#endif
