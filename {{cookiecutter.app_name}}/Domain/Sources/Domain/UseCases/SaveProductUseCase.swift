//
//  SaveProductUseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Foundation

public final class SaveProductUseCase: UseCase {
  var saveProduct: (_ input: Product) async throws -> Void

  public init<R: Repository>(repository: R)
  where R.CreateInput == Input, R.CreateOutput == Output {
    self.saveProduct =
      repository.create(input:)
  }

  @Sendable public func execute(input: Product) async throws {
    return try await saveProduct(input)
  }
}
