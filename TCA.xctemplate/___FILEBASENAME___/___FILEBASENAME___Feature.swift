//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Commons
import ComposableArchitecture
import Domain
import Foundation

public struct ___VARIABLE_moduleName___Feature: FeatureReducer {

  public init() {}

  @ObservableState
  public struct State: Equatable, Hashable {
    public init() {}
  }

  public enum ViewAction {

  }

  public enum InternalAction {

  }

  public var body: some ReducerOf<Self> {

  }

  public func reduce(into state: inout State, viewAction: ViewAction) -> Effect<Action> {
    switch viewAction {

    }
  }

  public func reduce(into state: inout State, presentedAction: Destination.Action) -> Effect<Action> {

  }

  public func reduce(into state: inout State, internalAction: InternalAction) -> Effect<Action> {
    switch internalAction {

    }
  }

  public struct Destination: DestinationReducer {

    public init() {}

    @dynamicMemberLookup
    @CasePathable
    public enum State: Hashable {

    }

    @CasePathable
    public enum Action {

    }

    public var body: some ReducerOf<Self> {

    }
  }
}
