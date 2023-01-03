//
//  ViewModel.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/24/22.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject {
    
    /**
     The type of the state of a certain scene
     */
    associatedtype State
    
    var state: State { get }
    
}
