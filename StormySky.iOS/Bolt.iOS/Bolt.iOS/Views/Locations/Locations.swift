//
//  Locations.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/19/22.
//

import SwiftUI

struct Locations: View {
    
    @ObservedObject var vm: LocationsViewModel
    
    init(){
        self.vm = LocationsViewModel()
    }
    
 
    var body: some View {
        VStack {
            /* Title */
            Text("Locations")
                .font(.title)
                .padding()
            
            /* Location List */
            ForEach(vm.state.locations) { location in
                LocationCell(location: location)
            }
            
            /* Add Button */
            Button(action: add) {
                Image(systemName: "plus")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Primary"))
            }
            .frame(width: 40, height: 40)
            .background(Color("PrimaryDark"))
            .clipShape(Circle())
            .padding()
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
    }
    
    /* Methods */
    private func add() -> Void {
        print("Adding City..")
    }
}

struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations()
    }
}
