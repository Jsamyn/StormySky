//
//  Home.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/16/22.
//

import SwiftUI

struct Home: View {
    
    let dailyForecastService: DailyForecastServiceProtocol
    let locationService: UserLocationServiceProtocol
    
    init(dailyForecastService: DailyForecastServiceProtocol, locationService: UserLocationServiceProtocol) {
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "PrimaryDark")
        
        self.dailyForecastService = dailyForecastService
        self.locationService = locationService
    }
    
    var body: some View {
        TabView {
            ForecastHome(dailyForecastService: self.dailyForecastService)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
            Locations(locationsService: self.locationService)
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
        }
    }
}

#if !TESTING
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(dailyForecastService: DailyForecastService(), locationService: UserLocationService())
    }
}
#endif
