//
//  ProductUseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public typealias ProductUseCaseType = UseCase<Int, Product?>

public final class ProductUseCase: UseCase {

  var getProduct: (_ input: Int) async throws -> Product?

  public init<R: RemoteProductRepository>(repository: R)
  where R.ReadInput == Input, R.ReadOutput == Output {
    self.getProduct = repository.read(input:)
  }

  public func callAsFunction(input: Int) async throws -> Product? {
    return try await getProduct(input)
  }
}
