//
//  AddLocationsModal.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 12/28/22.
//

import SwiftUI

/**
 Add location modal for locations page
 
 - Note: Displayed when add button is clicked
 */
struct AddLocationsModal: View {
    
    @State private var t: String = ""
    @Binding var isVisible: Bool
    @ObservedObject var vm: LocationsViewModel
    
    var body: some View {
        if isVisible {
            ZStack {
                Color("Primary")
                
                VStack {
                    // MARK: Text Field
                    TextField("Enter zip code of location..",
                              text: $t)
                    .padding()
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("Primary")))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).strokeBorder(Color("Secondary"))
                    )
                    .padding()
                    
                    // MARK: Add Button
                    Button {
                        print("Adding Location..")
                    } label: {
                        Text("Add")
                            .foregroundColor(Color("SecondaryLight"))
                    }
                    .frame(maxWidth: 240, maxHeight: 40)
                    .background(Color("PrimaryDark"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(5)
                    
                    // MARK: Cancel Button
                    Button("Cancel") {
                        Task {
                            await vm.trigger(.toggleModal)
                        }
                    }
                    .foregroundColor(Color("PrimaryDark"))
                    .frame(maxWidth: 240, maxHeight: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    
                }
            }
            .frame(maxWidth: 330, maxHeight: 220)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct AddLocationsModal_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationsModal(isVisible: Binding.constant(true), vm: LocationsViewModel(locationService: UserLocationService()))
    }
}
