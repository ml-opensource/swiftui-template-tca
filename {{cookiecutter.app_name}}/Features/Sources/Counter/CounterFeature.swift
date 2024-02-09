//
//  CounterFeature.swift
//  Features
//
//  Created by Rokon on 24/01/2024.
//  Copyright © 2024 MLBD. All rights reserved.
//

import Common
import ComposableArchitecture
import Foundation

public struct Counter: FeatureReducer {

  public init() {}

  public struct State: Equatable, Hashable {
    public init() {}

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

  public func reduce(into state: inout State, viewAction: ViewAction) -> Effect<
    Action
  > {
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

  public func reduce(into state: inout State, internalAction: InternalAction)
    -> Effect<Action>
  {
    switch internalAction {
    case .close:
      return .send(.delegate(.close))
    }
  }
}
