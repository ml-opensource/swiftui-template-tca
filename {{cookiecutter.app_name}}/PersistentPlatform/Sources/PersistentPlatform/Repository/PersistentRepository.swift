//
//  PersistentRepository.swift
//  PersistentPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Domain

public struct PersistentRepository: Repository {

  private let persistenceController: PersistenceController

  private init(persistenceController: PersistenceController) {
    self.persistenceController = persistenceController
  }

  public func prepare() async {
    do {
      try await persistenceController.prepare()
    } catch {
      fatalError(error.localizedDescription)
    }
  }

  public func create(input: Domain.Product) async throws {
    await persistenceController.update(
      entityType: Product.self, createIfNil: true
    ) {
      $0?.id = "\(input.id)"
      $0?.title = input.title
      $0?.price = input.price
      $0?.image = input.image
      //            $0?.rating = product.rating.toManagedObject(in: persistenceController.container.newBackgroundContext())
      $0?.category = input.category
      $0?.productDescription = input.description
    }
  }

  public func read(input: Int) async throws -> Domain.Product? {
    await persistenceController.fetchDomainObject(entityType: Product.self)
  }

  public func update(input: Int) async throws -> Product? {
    fatalError("Unimplemented")
  }

  public func delete(input: Int) async throws -> Product? {
    fatalError("Unimplemented")
  }
}

extension PersistentRepository {
  public static var live = PersistentRepository(
    persistenceController: PersistenceController.shared)
  public static var stubbed = PersistentRepository(
    persistenceController: PersistenceController.shared)
}
