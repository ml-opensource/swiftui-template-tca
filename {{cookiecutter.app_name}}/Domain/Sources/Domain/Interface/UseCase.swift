//
//  UseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public protocol UseCase<Input, Output> {
  associatedtype Input
  associatedtype Output

  func callAsFunction(input: Input) async throws -> Output
}

extension UseCase where Input == Void {
  public func callAsFunction() async throws -> Output {
    try await callAsFunction(input: ())
  }
}
