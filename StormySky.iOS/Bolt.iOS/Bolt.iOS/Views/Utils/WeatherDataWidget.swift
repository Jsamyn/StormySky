//
//  WeatherDataWidget.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/16/22.
//

import SwiftUI

struct WeatherDataWidget: View {
    
    var icon: String
    var name: String
    var value: String
    
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(Color("PrimaryDark"))
            CText(name)
                .padding(0.5)
            CText(value)
        }
        
    }
}

struct WeatherDataWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDataWidget(icon: "sunrise", name: "Sunrise", value: "6:10")
            .previewLayout(.sizeThatFits)
    }
}
