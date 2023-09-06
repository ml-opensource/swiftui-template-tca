//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Domain
import Commons
import Foundation
import ComposableArchitecture

public struct  ___VARIABLE_moduleName___Feature: Reducer {
    
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: BaseAction {
        
        enum ViewAction: Equatable {
            case onAppear
            
        }
        
        enum InlyingAction: Equatable {
            
        }
        
        enum DelegateAction: Equatable {
            
        }
        
        case view(ViewAction)
        case inlying(InlyingAction)
        case delegate(DelegateAction)
    }
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .view(let action):
            switch action {
            case .onAppear:
                return .none
                
            }
        case .inlying(let action):
            switch action {
                
            }
        case .delegate(let action):
            switch action {
                
            }
        }
    }
    
//    Remove commented code if not needed
//    public var body: some Reducer<State, Action> {
//
//        Reduce { state, action in
//
//        }
//    }
}
