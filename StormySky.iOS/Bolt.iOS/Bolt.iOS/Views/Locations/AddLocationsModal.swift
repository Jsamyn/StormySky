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
    
    @ObservedObject var vm: LocationsViewModel
    
    var body: some View {
        VStack {
            // MARK: Text Field
            TextField("",
                      text: $vm.state.locationsText, prompt: Text("Enter zip code of location..").foregroundColor(Color("PrimaryLight")))
            .padding()
            .frame(height: 40)
            .foregroundColor(Color("PrimaryDark"))
            .accentColor(Color("PrimaryDark"))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color("Secondary"))
                    .background(Color("Primary"))
            )
            .padding(.horizontal)
            .keyboardType(.numberPad)
            .accessibilityIdentifier("Location_Text_Field")
            
            Text(vm.state.locationsErrorText)
                .foregroundColor(Color("ErrorRed"))
                .padding(.bottom, 10)
            
            // MARK: Add Button
            Button {
                self.vm.addLocation()
            } label: {
                Text("Add")
                    .foregroundColor(Color("SecondaryLight"))
                    .accessibilityIdentifier("Add_Button_Text")
            }
            .frame(maxWidth: 240, maxHeight: 40)
            .background(Color("PrimaryDark"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
            .accessibilityIdentifier("Add_Button")

            
            // MARK: Cancel Button
            Button("Cancel") {
                withAnimation(.linear(duration: 0.2)) {
                    vm.toggleAddLocationModal()
                }
            }
            .foregroundColor(Color("PrimaryDark"))
            .frame(maxWidth: 240, maxHeight: 40)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
            .accessibilityIdentifier("Cancel_Button")

        }
        .frame(maxWidth: 330, maxHeight: 220)
        .background(Color("Primary"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .accessibilityIdentifier("Add_Location_Modal")
    }
}

#if !TESTING
struct AddLocationsModal_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationsModal(vm: LocationsViewModel(locationService: UserLocationService()))
    }
}
#endif
