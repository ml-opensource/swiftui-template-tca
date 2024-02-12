//
//  FeatureReducer.swift
//  Common
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

// MARK: FeatureReducer
public protocol FeatureReducer: Reducer
where State: Sendable & Hashable, Action == FeatureAction<Self> {
  associatedtype ViewAction: Sendable & Equatable = Never
  associatedtype InternalAction: Sendable & Equatable = Never
  associatedtype ChildAction: Sendable & Equatable = Never
  associatedtype DelegateAction: Sendable & Equatable = Never

  func reduce(into state: inout State, viewAction: ViewAction) -> Effect<Action>
  func reduce(into state: inout State, internalAction: InternalAction)
    -> Effect<Action>
  func reduce(into state: inout State, childAction: ChildAction) -> Effect<
    Action
  >
  func reduce(into state: inout State, presentedAction: Destination.Action)
    -> Effect<Action>
  func reduceDismissDestination(into state: inout State) -> Effect<Action>

  associatedtype Destination: DestinationReducer = EmptyDestination
  associatedtype ViewState: Equatable = Never
}

extension Reducer where Self: FeatureReducer {
  public typealias Action = FeatureAction<Self>

  public var body: some ReducerOf<Self> {
    Reduce(core)
  }

  public func core(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .destination(.dismiss):
      reduceDismissDestination(into: &state)
    case let .destination(.presented(presentedAction)):
      reduce(into: &state, presentedAction: presentedAction)
    case let .view(viewAction):
      reduce(into: &state, viewAction: viewAction)
    case let .internal(internalAction):
      reduce(into: &state, internalAction: internalAction)
    case let .child(childAction):
      reduce(into: &state, childAction: childAction)
    case .delegate:
      .none
    }
  }

  public func reduce(into state: inout State, viewAction: ViewAction) -> Effect<
    Action
  > {
    .none
  }

  public func reduce(into state: inout State, internalAction: InternalAction)
    -> Effect<Action>
  {
    .none
  }

  public func reduce(into state: inout State, childAction: ChildAction)
    -> Effect<Action>
  {
    .none
  }

  public func reduce(
    into state: inout State, presentedAction: Destination.Action
  ) -> Effect<Action> {
    .none
  }

  public func reduceDismissDestination(into state: inout State) -> Effect<
    Action
  > {
    .none
  }

}

public typealias PresentationStoreOf<R: Reducer> = Store<
  PresentationState<R.State>, PresentationAction<R.Action>
>

// MARK: FeatureAction
@CasePathable
public enum FeatureAction<Feature: FeatureReducer>: Sendable, Equatable {
  case destination(PresentationAction<Feature.Destination.Action>)
  case view(Feature.ViewAction)
  case `internal`(Feature.InternalAction)
  case child(Feature.ChildAction)
  case delegate(Feature.DelegateAction)
}

// MARK: DestinationReducer
public protocol DestinationReducer: Reducer
where State: Sendable & Hashable, Action: Sendable & Equatable & CasePathable {}

// MARK: EmptyDestination

public enum EmptyDestination: DestinationReducer {
  public struct State: Sendable, Hashable {}
  public typealias Action = Never
  public func reduce(into state: inout State, action: Never) -> Effect<Action> {
  }
  public func reduceDismissDestination(into state: inout State) -> Effect<
    Action
  > { .none }
}

//MARK: FeatureAction + Hashable
extension FeatureAction: Hashable
where
  Feature.Destination.Action: Hashable,
  Feature.ViewAction: Hashable,
  Feature.ChildAction: Hashable,
  Feature.InternalAction: Hashable,
  Feature.DelegateAction: Hashable
{
  public func hash(into hasher: inout Hasher) {
    switch self {
    case let .destination(action):
      hasher.combine(action)
    case let .view(action):
      hasher.combine(action)
    case let .internal(action):
      hasher.combine(action)
    case let .child(action):
      hasher.combine(action)
    case let .delegate(action):
      hasher.combine(action)
    }
  }
}

/// For scoping to an actionless childstore
public func actionless<T>(never: Never) -> T {}
