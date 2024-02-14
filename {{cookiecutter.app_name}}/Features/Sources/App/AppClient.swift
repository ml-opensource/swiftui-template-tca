//
//  AppClient.swift
//  Features
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Dependencies
import Domain
import Foundation
import NetworkPlatform
import PersistentPlatform

public struct AppClient {
  public var prepare: (()) async -> Void
  public var save: @Sendable (_ request: Domain.Product) async throws -> Void
  public var product: @Sendable (_ request: Int) async throws -> Domain.Product?
}

extension AppClient {
  private init(
    _ prepare: PrepareCoreDataUseCase, productUseCase: ProductUseCase,
    saveProduct: SaveProductUseCase
  ) {
    self.prepare = prepare.execute(input:)
    self.save = saveProduct.execute(input:)
    self.product = productUseCase.execute(input:)
  }
}

extension DependencyValues {
  public var appClient: AppClient {
    get { self[AppClient.self] }
    set { self[AppClient.self] = newValue }
  }
}

extension AppClient: DependencyKey {
  public static var liveValue = AppClient(
    PrepareCoreDataUseCase(repository: PreparePersistentRepository.live),
    productUseCase: ProductUseCase(repository: RemoteProductRepository.live),
    saveProduct: SaveProductUseCase(
      repository: PersistentProductRepository.live))
  public static var testValue = AppClient(
    PrepareCoreDataUseCase(repository: PreparePersistentRepository.live),
    productUseCase: ProductUseCase(repository: RemoteProductRepository.stubbed),
    saveProduct: SaveProductUseCase(
      repository: PersistentProductRepository.live))
  public static var previewValue = AppClient(
    PrepareCoreDataUseCase(repository: PreparePersistentRepository.live),
    productUseCase: ProductUseCase(repository: RemoteProductRepository.stubbed),
    saveProduct: SaveProductUseCase(
      repository: PersistentProductRepository.live))
}
