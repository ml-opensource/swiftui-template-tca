//
//  AppFeature.swift
//  Features
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Common
import Counter
import ComposableArchitecture

public struct AppFeature: FeatureReducer {
    public init() { }
    
    public struct State: Equatable, Hashable {
        public init() { }
        
        @PresentationState var destination: Destination.State?
    }
    
    public enum ViewAction: Equatable {
        case showSheet
        case showFullScreenCover
    }
    
    public enum InternalAction: Equatable {
        case dismissDestination
    }
    
    public var body: some ReducerOf<Self> {
        Reduce(core)
            .ifLet(\.$destination, action: \.destination) {
                Destination()
            }
    }
    
    public func reduce(into state: inout State, viewAction: ViewAction) -> Effect<Action> {
        switch viewAction {
        case .showSheet:
            state.destination = .sheet(.init())
            return .none
            
        case .showFullScreenCover:
            state.destination = .fullScreenCover(.init())
            return .none
        }
    }
    
    public func reduce(into state: inout State, presentedAction: Destination.Action) -> Effect<Action> {
        switch presentedAction {
        case .sheet(.delegate(.close)):
            return .send(.internal(.dismissDestination))
            
        case .fullScreenCover(.delegate(.close)):
            return .send(.internal(.dismissDestination))
            
        default:
            return .none
        }
    }
    
    public func reduce(into state: inout State, internalAction: InternalAction) -> Effect<Action> {
        switch internalAction {
        case .dismissDestination:
            state.destination = nil
            return .none
        }
    }
    
    public struct Destination: DestinationReducer {
        
        public init() { }
        
        @CasePathable
        public enum State: Hashable {
            case sheet(Counter.State)
            case fullScreenCover(Counter.State)
        }
        
        @CasePathable
        public enum Action: Equatable {
            case sheet(Counter.Action)
            case fullScreenCover(Counter.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: \.sheet, action: \.sheet) {
                Counter()
            }
            Scope(state: \.fullScreenCover, action: \.fullScreenCover) {
                Counter()
            }
        }
    }
}

