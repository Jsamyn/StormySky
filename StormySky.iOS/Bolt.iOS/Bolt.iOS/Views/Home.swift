//
//  Home.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/16/22.
//

import SwiftUI

struct Home: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "PrimaryDark")
    }
    
    var body: some View {
        TabView {
            ForecastHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
            Text("Locations")
                .tabItem {
                    Label("Locations", systemImage: "building.2")
                }
            
            Text("Forecast")
                .tabItem {
                    Label("Forecast", systemImage: "calendar")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }.toolbar(.visible, for: .tabBar)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
