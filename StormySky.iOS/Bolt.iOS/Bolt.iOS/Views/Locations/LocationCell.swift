//
//  LocationCell.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/19/22.
//

import SwiftUI

struct LocationCell: View {
    
    var location: UserLocation
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                CText("\(location.city), \(location.state)")
                    .font(.title)
            }
            .padding()
            
            Spacer()
            
            CText("\(location.lastTemp)°")
                .font(.title)
            Image(systemName: location.icon)
                .foregroundColor(Color("PrimaryDark"))
                .font(.title)
        }
        .padding(5)
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(location.isSelected ? Color("PrimaryDark") : Color("Primary"))
        )
    }
}

#if !TESTING
struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        let l = UserLocation(id: 1, isSelected: true, city: "Chicago", state: "IL", latitude: 1.0, longitude: 1.0, lastTemp: 80, icon: "sun.max")
        LocationCell(location: l)
            .background(Color("Primary"))
    }
}
#endif
