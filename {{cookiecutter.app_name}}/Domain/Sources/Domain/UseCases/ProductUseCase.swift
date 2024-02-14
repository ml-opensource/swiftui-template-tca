//
//  ProductUseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public final class ProductUseCase: UseCase {

  var getProduct: (_ input: Int) async throws -> Product?

  public init<R: RemoteProductRepository>(repository: R)
  where R.ReadInput == Input, R.ReadOutput == Output {
    self.getProduct = repository.read(input:)
  }

  @Sendable public func execute(input: Int) async throws -> Product? {
    return try await getProduct(input)
  }
}
