//
//  CounterFeature.swift
//  Features
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
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
        case closeButtonTapped
    }
    
    public enum InternalAction: Equatable {
        case close
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
            
        case .closeButtonTapped:
            return .send(.internal(.close))
        }
    }
    
    public func reduce(into state: inout State, internalAction: InternalAction) -> Effect<Action> {
        switch internalAction {
        case .close:
            return .send(.delegate(.close))
        }
    }
}
