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
    
    /**
     An input that can be triggered via the trigger method
     */
    associatedtype Input
    
    var state: State { get }
    
    /**
     Updates state based on the input provided
     */
    func trigger(_ input: Input) async 
}
