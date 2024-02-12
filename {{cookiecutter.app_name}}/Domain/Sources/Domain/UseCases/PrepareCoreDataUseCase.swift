//
//  PrepareCoreDataUseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public final class PrepareCoreDataUseCase: UseCase {
  var prepare: () async throws -> Void
  public init<R: Repository>(repository: R) {
    self.prepare =
      repository.prepare
  }

  public func execute(input: Void) async {
    try? await prepare()
  }
}
