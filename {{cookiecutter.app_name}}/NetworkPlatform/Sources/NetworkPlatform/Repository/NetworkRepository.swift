//
//  NetworkRepository.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Domain

public struct NetworkRepository: Repository {

  private let network: AppNetworking

  private init(network: AppNetworking) {
    self.network = network
  }

  public func prepare() {
    fatalError("Unimplemented")
  }

  public func create(input: Int) async throws -> Product? {
    fatalError("Unimplemented")
  }

  public func read(input: Int) async throws -> Product? {
    try await network.requestObject(
      .product(id: input),
      type: Product.self)
  }

  public func update(input: Int) async throws -> Product? {
    fatalError("Unimplemented")
  }

  public func delete(input: Int) async throws -> Product? {
    fatalError("Unimplemented")
  }
}

extension NetworkRepository {
  public static var live = NetworkRepository(
    network: AppNetworking.defaultNetworking())
  public static var stubbed = NetworkRepository(
    network: AppNetworking.stubbingNetworking())
}
