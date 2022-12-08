//
//  Home.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/16/22.
//

import SwiftUI

struct Home: View {
    
    let dailyForecastService: DailyForecastServiceProtocol
    
    init(dailyForecastService: DailyForecastServiceProtocol) {
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "PrimaryDark")
        
        self.dailyForecastService = dailyForecastService
    }
    
    var body: some View {
        TabView {
            ForecastHome(dailyForecastService: self.dailyForecastService)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
            Locations()
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
        Home(dailyForecastService: MockDailyForecastService())
    }
}
