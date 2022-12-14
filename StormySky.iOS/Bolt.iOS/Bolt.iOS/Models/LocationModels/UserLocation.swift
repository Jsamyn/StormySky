//
//  UserLocation.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/24/22.
//

import Foundation

struct UserLocation : Identifiable {
    
    /**
     Unique ID for the location
     */
    var id: Int
    
    /**
     Flag showing weather location is users current preferred location
     */
    var isSelected: Bool
    
    /**
     Name of the city
     */
    var city: String
    
    /**
     State where location resides
     */
    var state: String
    
    /**
     Geographic latitude of the city
     */
    var latitude: Double
    
    /**
     Geographic longitude of the city
     */
    var longitude: Double
    
    /**
     Last temperature fetched for the city
     */
    var lastTemp: Int
    
    /**
     Icon name for last fetched forecast
     */
    var icon: String
}
