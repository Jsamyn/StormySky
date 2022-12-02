//
//  AnyViewModel.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/24/22.
//

import Foundation
import Combine

final class AnyViewModel<State, Input>: ViewModel {
    var state: State
    
    
    // MARK: Stored Properties
//    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
//    private let wrappedState: () -> State
//    private let wrappedTrigger: (Input) -> Void
    
    // MARK: Compued Properties
//    var objectWillChange: AnyPublisher<Void, Never> {
//        //wrappedObjectWillChange()
//    }
    
//    var state: State {
//       // wrappedState()
//    }
    
    // MARK: Methods
    
    func trigger(_ input: Input) {
        //wrappedTrigger(input)
    }
    
    // MARK: Initializer
    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
//        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
//        self.wrappedState = { viewModel.state }
//        self.wrappedTrigger = viewModel.trigger
        self.state = viewModel.state
    }
    
}
