//
//  Bolt_iOSApp.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 10/22/22.
//

import SwiftUI

@main
struct Bolt_iOSApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
