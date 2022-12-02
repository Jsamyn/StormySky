//
//  LocationCell.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/19/22.
//

import SwiftUI

struct LocationCell: View {
    
    var isSelected: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("United States")
                Text("Chicago, IL")
                    .font(.title)
            }
            .padding()
            
            Spacer()
            
            Text("22°")
                .font(.title)
            
            Image(systemName: "sun.max")
                .font(.title)
        }
        .padding(5)
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color("PrimaryDark") : Color("Primary"))
        )
        .padding(10)
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell(isSelected: false)
            .background(Color("Primary"))
    }
}
