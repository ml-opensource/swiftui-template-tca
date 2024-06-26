//
//  SaveProductUseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public typealias SaveProductUseCaseType = UseCase<Product, Void>

public final class SaveProductUseCase: UseCase {
  var saveProduct: (_ input: Product) async throws -> Void

  public init<R: PersistentProductRepository>(repository: R)
  where R.CreateInput == Input, R.CreateOutput == Output {
    self.saveProduct = repository.create(input:)
  }

  public func callAsFunction(input: Product) async throws {
    return try await saveProduct(input)
  }
}
