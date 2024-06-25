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

struct AppClient {
  var getProduct: any ProductUseCaseType
  var saveProduct: any SaveProductUseCaseType
  var prepareCoreData: any PrepareCoreDataUseCaseType

  init(
    _ prepare: PrepareCoreDataUseCase,
    getProductUseCase: ProductUseCase,
    saveProductUseCase: SaveProductUseCase
  ) {
    self.prepareCoreData = prepare
    self.getProduct = getProductUseCase
    self.saveProduct = saveProductUseCase
  }
}

extension DependencyValues {
  var appClient: AppClient {
    get { self[AppClient.self] }
    set { self[AppClient.self] = newValue }
  }
}

extension AppClient: DependencyKey {
  public static var liveValue = AppClient(
    PrepareCoreDataUseCase(repository: PreparePersistentRepository.live),
    getProductUseCase: ProductUseCase(repository: RemoteProductRepository.live),
    saveProductUseCase: SaveProductUseCase(
      repository: PersistentProductRepository.live))
  public static var testValue = AppClient(
    PrepareCoreDataUseCase(repository: PreparePersistentRepository.live),
    getProductUseCase: ProductUseCase(repository: RemoteProductRepository.stubbed),
    saveProductUseCase: SaveProductUseCase(
      repository: PersistentProductRepository.live))
  public static var previewValue = AppClient(
    PrepareCoreDataUseCase(repository: PreparePersistentRepository.live),
    getProductUseCase: ProductUseCase(repository: RemoteProductRepository.stubbed),
    saveProductUseCase: SaveProductUseCase(
      repository: PersistentProductRepository.live))
}
