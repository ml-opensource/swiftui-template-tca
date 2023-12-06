//
//  CounterFeature.swift
//
//
//  Created by Md. Arman Morshed on 6/12/23.
//

import Foundation
import Common
import ComposableArchitecture

public struct Counter: FeatureReducer {
    
    public init() { }
    
    public struct State: Equatable, Hashable {
        public init() { }
        
        var count = 0
    }
    
    public enum ViewAction: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    public enum DelegateAction: Equatable {
        case close
    }
    
    public func reduce(into state: inout State, viewAction: ViewAction) -> Effect<Action> {
        switch viewAction {
        case .decrementButtonTapped:
            state.count -= 1
            return .none
            
        case .incrementButtonTapped:
            state.count += 1
            return .none
        }
    }
}
