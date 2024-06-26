//
//  PrepareCoreDataUseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public typealias PrepareCoreDataUseCaseType = UseCase<Void, Void>

public class PrepareCoreDataUseCase: UseCase {
  var prepare: () async throws -> Void

  public init<R: PrepareRepository>(repository: R) {
    self.prepare = repository.prepare
  }

  public func callAsFunction(input: Void) async {
    try? await prepare()
  }
}
