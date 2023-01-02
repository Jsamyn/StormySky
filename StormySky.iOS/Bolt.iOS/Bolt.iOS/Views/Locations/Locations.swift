//
//  Locations.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/19/22.
//

import SwiftUI



/**
 Main view for locations page
 */
struct Locations: View {
    
    @ObservedObject var vm: LocationsViewModel
    
    init(locationsService: UserLocationServiceProtocol){
        self.vm = LocationsViewModel(locationService: locationsService)
    }
    
 
    var body: some View {
        
        // MARK: Main Page
        ZStack {
            VStack {
                /* Title */
                CText("Locations")
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
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Primary"))
            .onAppear{
                Task {
                    await vm.trigger(LocationsInput.load)
                }
            }
            .zIndex(0)
            
            // MARK: Location Add Modal
            //AddLocationsModal(vm: vm)
            if vm.state.addLocationsVisible {
                
                Group {
                    Color("Secondary")
                        .opacity(0.6)
                        .edgesIgnoringSafeArea(.top)
                    
                    AddLocationsModal(vm: self.vm)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    
                }.zIndex(1)
            }
        }
        
        
    }
    
    /* Methods */
    
    /**
     Display Add Locations Modal
     */
    private func add() -> Void {
        withAnimation(.spring(dampingFraction: 0.8).speed(1.3)) {
            vm.state.addLocationsVisible.toggle()
        }
    }
}

#if !TESTING
struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations(locationsService: UserLocationService())
    }
}
#endif
