//
//  AppFeature.swift
//  Features
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Common
import ComposableArchitecture
import Counter
import Domain

public struct AppFeature: FeatureReducer {

  @Dependency(\.productClient) var productClient
  public init() {}

  public struct State: Equatable, Hashable {
    public init() {}

    @PresentationState var destination: Destination.State?
    var product: Product?
  }

  public enum ViewAction: Equatable {
    case onAppear
    case showSheet
    case showFullScreenCover
    case save
  }

  public enum InternalAction: Equatable {
    case dismissDestination
    case productResponse(TaskResult<Product?>)
  }

  public var body: some ReducerOf<Self> {
    Reduce(core)
      .ifLet(\.$destination, action: \.destination) {
        Destination()
      }
  }

  public func reduce(into state: inout State, viewAction: ViewAction) -> Effect<
    Action
  > {
    switch viewAction {
    case .onAppear:
      return .run { send in
        await productClient.prepare(Void())
        await send(
          .internal(
            .productResponse(
              TaskResult {
                try await productClient.product(1)
              })))
      }
    case .showSheet:
      state.destination = .sheet(.init())
      return .none

    case .showFullScreenCover:
      state.destination = .fullScreenCover(.init())
      return .none

    case .save:
      return .run { [product = state.product] send in
        do {
          try await productClient.save(product!)
        } catch {

        }
      }
    }
  }

  public func reduce(
    into state: inout State, presentedAction: Destination.Action
  ) -> Effect<Action> {
    switch presentedAction {
    case .sheet(.delegate(.close)):
      return .send(.internal(.dismissDestination))

    case .fullScreenCover(.delegate(.close)):
      return .send(.internal(.dismissDestination))

    default:
      return .none
    }
  }

  public func reduce(into state: inout State, internalAction: InternalAction)
    -> Effect<Action>
  {
    switch internalAction {
    case let .productResponse(.success(product)):
      state.product = product
      return .none
    case let .productResponse(.failure(error)):
      print(error)
      return .none
    case .dismissDestination:
      state.destination = nil
      return .none
    }
  }

  public struct Destination: DestinationReducer {

    public init() {}

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
